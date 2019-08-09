SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;

--
-- Tabelstructuur `tree`
--

CREATE TABLE `tree` (
  `id` int(11) UNSIGNED NOT NULL,
  `position_x` double DEFAULT NULL,
  `position_y` double DEFAULT NULL,
  `position_z` double DEFAULT NULL,
  `regrow` int(1) NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Indexen `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT `tree`
--
ALTER TABLE `tree`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;
