INSERT INTO USER_ACCOUNT (ID, USERNAME, PASSWORD, SALT, FIRST_NAME, SURNAME, EMAIL) VALUES
  (1, 'User', '541338d92cd0dbf230d7e7666dd99adaea8da7a478f5456947c2445aecea0b1a', 'ad68dc115126d9d1', 'userName', 'userSurname', 'user@gmail.com');
INSERT INTO USER_ACCOUNT (ID, USERNAME, PASSWORD, SALT, FIRST_NAME, SURNAME, EMAIL) VALUES
  (2, 'Admin', 'b03209e6c608cdf3753ab36449703abeab6aa7aab628e569b37a55381d4aa021', '94bd6b18b8f70298', 'adminName', 'adminSurname', 'admin@gmail.com');


INSERT INTO ROLE (ID, NAME) VALUES
  (3, 'USER');
INSERT INTO ROLE (ID, NAME) VALUES
  (4, 'ADMIN');


INSERT INTO PERMISSION (ID, NAME) VALUES
  (5, 'USER_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (6, 'USER_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (7, 'USER_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (8, 'USER_DELETE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (9, 'USER_READ_OWN');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (10, 'USER_UPDATE_OWN');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (11, 'ROLE_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (12, 'ROLE_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (13, 'ROLE_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (14, 'ROLE_DELETE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (15, 'PERMISSION_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (16, 'PERMISSION_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (17, 'PERMISSION_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (18, 'PERMISSION_DELETE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (19, 'CRUD_CLASS_META_DATA_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (20, 'CRUD_CLASS_META_DATA_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (21, 'CRUD_CLASS_META_DATA_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (22, 'CRUD_CLASS_META_DATA_DELETE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (23, 'CRUD_META_FORM_DATA_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (24, 'CRUD_META_FORM_DATA_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (25, 'CRUD_META_FORM_DATA_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (26, 'CRUD_META_FORM_DATA_DELETE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (27, 'CRUD_META_GRID_DATA_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (28, 'CRUD_META_GRID_DATA_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (29, 'CRUD_META_GRID_DATA_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (30, 'CRUD_META_GRID_DATA_DELETE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (31, 'META_DATA_PROPERTY_BINDING_PARAMETER_READ');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (32, 'META_DATA_PROPERTY_BINDING_PARAMETER_UPDATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (33, 'META_DATA_PROPERTY_BINDING_PARAMETER_CREATE');
INSERT INTO PERMISSION (ID, NAME) VALUES
  (34, 'META_DATA_PROPERTY_BINDING_PARAMETER_DELETE');

INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES
  (1, 3);
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES
  (2, 4);

INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (3, 9);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (3, 10);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 5);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 6);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 7);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 8);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 9);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 10);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 11);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 12);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 13);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 14);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 15);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 16);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 17);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 18);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 19);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 20);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 21);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 22);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 23);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 24);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 25);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 26);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 27);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 28);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 29);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 30);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 31);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 32);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 33);
INSERT INTO ROLE_PERMISSION (ROLE_ID, PERMISSION_ID) VALUES
  (4, 34);


INSERT INTO CRUD_CLASS_META_DATA (ID, CLASS_NAME, TITLE_COLUMNS, EDITABLE, QUERY_NAME) VALUES
  (35, 'CrudMetaGridData', 'columnWidth', true, null);
INSERT INTO CRUD_CLASS_META_DATA (ID, CLASS_NAME, TITLE_COLUMNS, EDITABLE, QUERY_NAME) VALUES
  (36, 'CrudMetaFormData', 'fieldLayoutGridPosition', true, null);
INSERT INTO CRUD_CLASS_META_DATA (ID, CLASS_NAME, TITLE_COLUMNS, EDITABLE, QUERY_NAME) VALUES
  (37, 'CrudClassMetaData', 'class', true, null);
INSERT INTO CRUD_CLASS_META_DATA (ID, CLASS_NAME, TITLE_COLUMNS, EDITABLE, QUERY_NAME) VALUES
  (38, 'MetaDataPropertyBindingParameter', 'operator', true, null);

INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (39, 'fromProperty', true, true, null, 1.0, 38, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (40, 'toProperty', true, true, null, 2.0, 38, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (41, 'combineOperator', true, true, null, 3.0, 38, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (42, 'operator', true, true, null, 4.0, 38, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (43, 'columnWidth', true, true, null, 1.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (44, 'property', true, true, null, 2.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (45, 'editable', true, true, null, 3.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (46, 'visible', true, true, null, 4.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (47, 'decorator', true, true, null, 5.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (48, 'order', true, true, null, 6.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (49, 'crudClassMetaData', true, true, null, 7.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (50, 'bingingProperties', true, true, null, 8.0, 35, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (51, 'fieldLayoutGridPosition', true, true, null, 1.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (52, 'property', true, true, null, 2.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (53, 'editable', true, true, null, 3.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (54, 'visible', true, true, null, 4.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (55, 'decorator', true, true, null, 5.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (56, 'order', true, true, null, 6.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (57, 'crudClassMetaData', true, true, null, 7.0, 36, null);
INSERT INTO CRUD_META_FORM_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, FIELD_LAYOUT_GRID_POSITION) VALUES
  (58, 'bingingProperties', true, true, null, 8.0, 36, null);


INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (59, 'fromProperty', true, true, null, 1.0, 38, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (60, 'toProperty', true, true, null, 2.0, 38, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (61, 'combineOperator', true, true, null, 3.0, 38, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (62, 'operator', true, true, null, 4.0, 38, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (63, 'columnWidth', true, true, null, 1.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (64, 'property', true, true, null, 2.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (65, 'editable', true, true, null, 3.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (66, 'visible', true, true, null, 4.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (67, 'decorator', true, true, null, 5.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (68, 'order', true, true, null, 6.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (69, 'crudClassMetaData', true, true, null, 7.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (70, 'bingingProperties', true, true, null, 8.0, 35, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (71, 'fieldLayoutGridPosition', true, true, null, 1.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (72, 'property', true, true, null, 2.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (73, 'editable', true, true, null, 3.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (74, 'visible', true, true, null, 4.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (75, 'decorator', true, true, null, 5.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (76, 'order', true, true, null, 6.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (77, 'crudClassMetaData', true, true, null, 7.0, 36, null);
INSERT INTO CRUD_META_GRID_DATA (ID, PROPERTY, EDITABLE, VISIBLE, DECORATOR, ORDER_NUMBER, CRUD_CLASS_META_DATA, COLUMN_WIDTH) VALUES
  (78, 'bingingProperties', true, true, null, 8.0, 36, null);

INSERT INTO META_DATA_PROPERTY_BINDING_PARAMETER (ID, FROM_PROPERTY, TO_PROPERTY) VALUES
  (79, 'customer', '@rid');

INSERT INTO META_DATA_PROPERTY_BINDING_PARAMETER_COMBINE_OPERATOR (META_DATA_PROPERTY_BINDING_PARAMETER_ID, COMBINE_OPERATOR) VALUES
  (79, 'OR');

INSERT INTO META_DATA_PROPERTY_BINDING_PARAMETER_OPERATOR (META_DATA_PROPERTY_BINDING_PARAMETER_ID, OPERATOR) VALUES
  (79, 'EQUALS');

INSERT INTO CUSTOMER (ID, CUSTOMER_ID, COMPANY_NAME, STREET, STREET2, POSTCODE, COUNTRY, CITY, VATID) VALUES
  (80, 1.0, 'SMSC', 'Amtsgericht', 'Amtsgericht', '3254', 'Germany', 'Stuttgart', 5672394.0);

INSERT INTO CUSTOMER_CONTACT (ID, FIRST_NAME, SURNAME, PHONE, MOBILE_PHONE, FAX, EMAIL_ADDRESS, CUSTOMER, SALUTATION, TYPE) VALUES
  (81, 'SMSC', 'SMSC', '0674329568', '0504569753', 'fake_fax', 'smsc@bulk.io', 80, 'TECHNICAL', 'CEO');

INSERT INTO CUSTOMER_USER(CUSTOMER_ID, USER_ID) VALUES
  (80,1);

INSERT INTO CUSTOMER_USER(CUSTOMER_ID, USER_ID) VALUES
  (80,2);


