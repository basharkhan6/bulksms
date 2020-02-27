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
INSERT INTO `user` (`id`, `address`, `dob`, `email`, `first_name`, `img_url`, `last_name`, `nid`, `password`) VALUES (10001, NULL, NULL, 'abc@d.c', 'Test', '', 'User', NULL, '$2a$10$W73TOISBruLqlzWvXAQecOB1GSuLO6eDMVt39Q5XmzxB.VmIVh1Ae');
INSERT INTO `user_roles` (`users_id`, `roles_id`) VALUES (10001, 1), (10001, 2);
INSERT INTO `package` (`id`, `duration`, `p_name`, `price`, `sms`, `type`) VALUES (101, 30, 'Test Package 1', 0.25, 1000, 'NON MASKING'), (102, 30, 'Test Package 2', 0.50, 1000, 'MASKING');