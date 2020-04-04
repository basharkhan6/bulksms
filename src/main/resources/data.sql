/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Bashar
 * Created: Jan 22, 2020
 */

INSERT INTO `role` (`id`, `name`) VALUES (1, 'USER'),(2, 'ADMIN');

-- Dummy Data
INSERT INTO `user` (`id`, `email`, `status`, `password`) VALUES (10001, 'abc@d.c', 'ACTIVE', '$2a$10$W73TOISBruLqlzWvXAQecOB1GSuLO6eDMVt39Q5XmzxB.VmIVh1Ae');
INSERT INTO `user` (`id`, `email`, `status`, `password`) VALUES (10002, 'abb@d.c', 'ACTIVE', '$2a$10$W73TOISBruLqlzWvXAQecOB1GSuLO6eDMVt39Q5XmzxB.VmIVh1Ae');

INSERT INTO `profile` (`id`, `address1`, `address2`, `city`, `company_name`, `country`, `dob`, `first_name`, `gender`, `img_url`, `last_name`, `nid`, `region`, `zip`, `user_id`) VALUES (10001, 'Shukrabad', NULL, 'Dhaka', 'SmartEdge', 'BANGLADESH', '2020-04-01', 'Abul', 'MALE', NULL, 'Basar', '12345678', 'Dhaka', '1207', 10001);
INSERT INTO `profile` (`id`, `address1`, `address2`, `city`, `company_name`, `country`, `dob`, `first_name`, `gender`, `img_url`, `last_name`, `nid`, `region`, `zip`, `user_id`) VALUES (10002, 'Shukrabad', NULL, 'Dhaka', 'SmartEdge', 'BANGLADESH', '2020-04-01', 'Abul', 'MALE', NULL, 'Basar 2', '12345678', 'Dhaka', '1207', 10002);

UPDATE `user` SET `profile_id` = 10001 WHERE `id` = 10001;
UPDATE `user` SET `profile_id` = 10002 WHERE `id` = 10002;

INSERT INTO `user_roles` (`users_id`, `roles_id`) VALUES (10001, 2), (10002, 1);

INSERT INTO `package` (`id`, `validity`, `p_name`, `price`, `sms`, `package_type`, `status`) VALUES (101, 30, 'Test Package 1', 0.25, 1000, 'NON_MASKING', 'ACTIVE'), (102, 30, 'Test Package 2', 0.50, 1000, 'MASKING', 'ACTIVE');