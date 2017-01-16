package io.smsc.controller;

import io.smsc.model.customer.Customer;
import io.smsc.repository.customer.customer.CustomerRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.net.URI;

/**
 * The CustomerRestController class is used for mapping HTTP requests for creating and
 * updating {@link Customer} entities, adding and removing {@link io.smsc.model.User}
 * from {@link Customer} and for deleting {@link Customer} onto specific methods
 * <p>
 * Methods in this class extend default {@link org.springframework.data.jpa.repository.JpaRepository}
 * methods in {@link io.smsc.repository.customer.customer.CustomerRepository}
 *
 * @author  Nazar Lipkovskyy
 * @since   0.0.1-SNAPSHOT
 */
@RestController
@RequestMapping("/rest/repository/customers")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    private final Logger log = LoggerFactory.getLogger(CustomerController.class);

    @PostMapping(value = "/create", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ADMIN') or hasAuthority('CUSTOMER_CREATE')")
    public ResponseEntity<Customer> create(@Valid @RequestBody Customer customer, HttpServletResponse response) throws IOException {
        log.info("create Customer");
        try {
            Customer created = customerRepository.save(customer);
            Customer newCustomer = customerRepository.findOne(created.getId());
            URI uriOfNewResource = ServletUriComponentsBuilder.fromCurrentContextPath()
                    .path("{id}")
                    .buildAndExpand(created.getId()).toUri();
            return ResponseEntity.created(uriOfNewResource).body(newCustomer);
        }
        catch (DataIntegrityViolationException ex) {
            // going to send error
        }
        response.sendError(HttpServletResponse.SC_CONFLICT, "Customer with this customerId already exists");
        return null;
    }

    @PutMapping(value = "/update/{id}",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ADMIN') or hasAuthority('CUSTOMER_UPDATE')")
    public ResponseEntity<Customer> update(@Valid @RequestBody Customer customer, @PathVariable("id") long id, HttpServletResponse response) throws IOException {
        log.info("update Customer with id " + id);
        try {
            Customer updated = customerRepository.findOne(id);
            if(!updated.getCustomerId().equals(customer.getCustomerId()) && customerRepository.findByCustomerId(customer.getCustomerId()) != null) {
                response.sendError(HttpServletResponse.SC_CONFLICT, "Customer with this customerId already exists");
                return null;
            }
            updated.setCustomerId(customer.getCustomerId());
            updated.setCompanyName(customer.getCompanyName());
            updated.setStreet(customer.getStreet());
            updated.setStreet2(customer.getStreet2());
            updated.setPostcode(customer.getPostcode());
            updated.setCountry(customer.getCountry());
            updated.setCity(customer.getCity());
            if(customer.getVatid() != null) {
                updated.setVatid(customer.getVatid());
            }
            if(customer.getParentCustomer() != null) {
                updated.setParentCustomer(customer.getParentCustomer());
            }
            customerRepository.save(updated);
            return new ResponseEntity<>(customerRepository.getOne(id), HttpStatus.OK);
        }
        catch (NullPointerException ex) {
            ex.printStackTrace();
            // going to send error
        }
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer with id = " + id + " was not found");
        return null;
    }

    /**
     * Method to add specific {@link io.smsc.model.User} to specific {@link Customer}
     *
     * @param  customerId  long value which identifies {@link io.smsc.model.customer.Customer} in database
     * @param  userId      long value which identifies {@link io.smsc.model.User} in database
     * @param  response    the {@link HttpServletResponse} to provide HTTP-specific
     *                     functionality in sending a response
     * @return             updated {@link io.smsc.model.customer.Customer} entity
     * @throws IOException on input error
     */
    @GetMapping(value = "/addUser", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Customer> addUser(@Param("customerId")long customerId, @Param("userId")long userId, HttpServletResponse response) throws IOException {
        log.info("add user with id = " + userId + " to customer with id = " + customerId);
        try {
            Customer customer = customerRepository.addUser(customerId,userId);
            customer.getCustomerId();
            return new ResponseEntity<>(customer, HttpStatus.OK);
        }
        catch (NullPointerException ex){
            // going to send error
        }
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer with id = " + customerId + " or user with id = " + userId + " was not found");
        return null;
    }

    /**
     * Method to remove specific {@link io.smsc.model.User} from specific {@link Customer}
     *
     * @param  customerId  long value which identifies {@link io.smsc.model.customer.Customer} in database
     * @param  userId      long value which identifies {@link io.smsc.model.User} in database
     * @param  response    the {@link HttpServletResponse} to provide HTTP-specific
     *                     functionality in sending a response
     * @return             updated {@link io.smsc.model.customer.Customer} entity
     * @throws IOException on input error
     */
    @GetMapping(value = "/removeUser", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Customer> removeUser(@Param("customerId")long customerId, @Param("userId")long userId, HttpServletResponse response) throws IOException {
        log.info("remove user with id = " + userId + " from customer with id = " + customerId);
        try {
            Customer customer = customerRepository.removeUser(customerId,userId);
            Double customer_id = customer.getCustomerId();
            return new ResponseEntity<>(customer, HttpStatus.OK);
        }
        catch (NullPointerException ex){
            // going to send error
        }
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer with id = " + customerId + " or user with id = " + userId + " was not found");
        return null;
    }

    /**
     * Method to remove specific {@link io.smsc.model.customer.Customer} from database
     * <p>
     * This method extends default
     * {@link io.smsc.repository.customer.customer.CustomerRepository#delete(Long)} method
     *
     * @param  id          long value which identifies {@link io.smsc.model.customer.Customer} in database
     * @param  response    the {@link HttpServletResponse} to provide HTTP-specific
     *                     functionality in sending a response
     * @throws IOException on input error
     */
    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") long id, HttpServletResponse response) throws IOException {
        log.info("delete Customer with id = " + id);
        try {
            Customer customer = customerRepository.findOne(id);
            for(Customer customer1 : customerRepository.findAll()) {
                if(customer.equals(customer1.getParentCustomer())) {
                    customer1.setParentCustomer(null);
                }
            }
            customerRepository.delete(id);
            response.setStatus(204);
        }
        catch (Exception ex) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer with id = " + id + " was not found");
        }
    }
}
