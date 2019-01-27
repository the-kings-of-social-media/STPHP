-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 27, 2019 at 03:47 PM
-- Server version: 5.7.24-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2019-01-27 21:35:57', '2019-01-27 21:35:57', 'ca1434ee-5434-472b-9cbe-1cf9acbf73cd');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2019-01-27 21:35:57', '2019-01-27 21:35:57', NULL, 'db9f3af0-690d-429e-be4d-08523b9c25da');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2019-01-27 21:35:57', '2019-01-27 21:35:57', 'fa00f990-cf14-458b-ac43-cf58767caf39');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entrydrafts`
--

CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entryversions`
--

CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2019-01-27 21:35:57', '2019-01-27 21:35:57', '7810689e-a439-44e4-a203-1f11e0c74c95');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.1.5', '3.1.23', 0, 'a:6:{s:11:\"fieldGroups\";a:1:{s:36:\"7810689e-a439-44e4-a203-1f11e0c74c95\";a:1:{s:4:\"name\";s:6:\"Common\";}}s:5:\"email\";a:3:{s:9:\"fromEmail\";s:21:\"brent@moxycompany.com\";s:8:\"fromName\";s:29:\"St. Tammany Parish Pediatrics\";s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";}s:10:\"siteGroups\";a:1:{s:36:\"1a5079bb-c97b-45a2-bc2f-1ec6cd7eee4c\";a:1:{s:4:\"name\";s:29:\"St. Tammany Parish Pediatrics\";}}s:5:\"sites\";a:1:{s:36:\"e21e108e-6a68-4988-92c8-1a0ad1ddde57\";a:8:{s:7:\"baseUrl\";s:17:\"$DEFAULT_SITE_URL\";s:6:\"handle\";s:7:\"default\";s:7:\"hasUrls\";b:1;s:8:\"language\";s:5:\"en-US\";s:4:\"name\";s:29:\"St. Tammany Parish Pediatrics\";s:7:\"primary\";b:1;s:9:\"siteGroup\";s:36:\"1a5079bb-c97b-45a2-bc2f-1ec6cd7eee4c\";s:9:\"sortOrder\";i:1;}}s:6:\"system\";a:5:{s:7:\"edition\";s:4:\"solo\";s:4:\"name\";s:29:\"St. Tammany Parish Pediatrics\";s:4:\"live\";b:1;s:13:\"schemaVersion\";s:6:\"3.1.23\";s:8:\"timeZone\";s:19:\"America/Los_Angeles\";}s:5:\"users\";a:5:{s:24:\"requireEmailVerification\";b:1;s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:14:\"photoVolumeUid\";N;s:12:\"photoSubpath\";s:0:\"\";}}', '{\"fieldGroups\":\"C:\\\\GitHub\\\\STPHP\\\\craft\\\\config\\\\project.yaml\",\"email\":\"C:\\\\GitHub\\\\STPHP\\\\craft\\\\config\\\\project.yaml\",\"siteGroups\":\"C:\\\\GitHub\\\\STPHP\\\\craft\\\\config\\\\project.yaml\",\"sites\":\"C:\\\\GitHub\\\\STPHP\\\\craft\\\\config\\\\project.yaml\",\"system\":\"C:\\\\GitHub\\\\STPHP\\\\craft\\\\config\\\\project.yaml\",\"users\":\"C:\\\\GitHub\\\\STPHP\\\\craft\\\\config\\\\project.yaml\"}', 'm5tVNYyXPpPL', '2019-01-27 21:35:57', '2019-01-27 21:35:58', 'd5e622ea-576a-404d-a18c-fc091992bf89');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '094b2f1c-e2e0-4dd8-ac68-de5650ccf512'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '17c0e45c-14cb-4e60-8fc0-2230fb059e1f'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '4b0abf7c-e7c4-4c6b-9d6a-1d45575fe4e0'),
(4, NULL, 'app', 'm150403_184533_field_version', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '567b76e4-4cf3-4568-a6c5-ac6c4a875e92'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd36406b2-bec1-4315-a562-e49e7b934917'),
(6, NULL, 'app', 'm150403_185142_volumes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '55fc01ed-4e32-443d-9e9d-6f258b28bd72'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '660a9e0e-b3a8-40df-ab57-397a393485c5'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'de06743d-c0e3-4121-b318-ee9530aa11e8'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'f57900e7-04f3-42c1-a808-cd8300d31fe7'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '48cf06d1-5171-4ffe-aa99-1779456dd075'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'a3ef5af9-535b-4322-b151-e0d5819a41f2'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'ce83e172-5187-48e5-a28f-06fa37139ca1'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'a89972e7-be46-4abc-824f-0b7e281ddb2c'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '8aff6232-917a-4677-b815-2bcec9445d2d'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'fbdd9d1c-38d0-4a2a-887b-4b2addfa6a34'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'a5e0b9aa-824c-43a2-b029-134207c47a1d'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'f5340658-1928-4e32-8f77-1df6b03dd078'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '436c316f-8688-477e-8cf3-db76a742e4cd'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '78cafc35-7425-428a-a30d-6e7c6936c935'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '5cd1dfb9-8a96-4108-b873-1472183063d1'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '169d9cec-0db7-4fd0-b8ba-7b31d6bcabc4'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd57406ce-dc1a-40b5-a13f-d4970c917864'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'c7866786-6227-40bc-9472-e721acd6827b'),
(24, NULL, 'app', 'm160807_144858_sites', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '6a6bb7f0-9cd5-4aab-813b-1f13febef21d'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '80691511-4bf4-4687-b616-6c2b0f558ce3'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '6f8a7c2a-b003-4c70-bdcf-4e27d51a35aa'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'cdc41cfd-4549-4130-855b-132ab82fb1b8'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '20fa0b2e-14aa-4ace-a097-9aabeb6ca027'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'e9efab35-4f76-4bba-b500-63be174e3bdf'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '62ddf4de-82f5-4f6c-a7f5-f95c11ec564a'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '5f5b6cf9-3458-4921-8dbc-79af5da45360'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '7e9b1949-77d0-4dbe-a7c1-102118e2ff96'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '92616e8c-bcbf-44ec-b34e-cf713787aada'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'a4d61f79-5c19-4c94-b36a-6d1e23097bef'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'fa70a5b1-e7b5-4097-8580-9a74a4135324'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd26755fe-8a36-4826-bc23-8466d3c14e18'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'ae6d9178-909c-4067-9db5-c1beecae37bf'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '33dfbfc4-d677-4afc-b659-5bd0d8343d6e'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '8da42652-9f65-4d86-b144-4678d763e68c'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '5125b3ed-18e9-4508-a085-3ceb18772a4a'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b2073f4d-a2bf-47e6-9e3c-09e02010eb9c'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '53d8e816-6fcc-422b-bc31-ad8a0e85ee5a'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'a2d6d643-4539-4c82-8a47-8aa70d39b3bd'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '6f56245b-b1b5-482d-9732-7120685e33dc'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '6270e13e-c825-4980-b190-0fc866ebad22'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '3cab80a6-8efa-46e7-b012-1ebf0c402788'),
(47, NULL, 'app', 'm170206_142126_system_name', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '3b84d55a-95a0-43e9-a522-f2791de88d57'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '23b74275-d94e-47fd-ae92-b3c5e4debf78'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'fc5686fd-0138-4b0d-b2b5-a25efb590768'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b459cea8-2a2a-467e-aa02-e99584107db2'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd875eed7-a981-489a-90e4-1eb287bd5970'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '569434c9-1c59-4895-90c7-69d30c96d5d0'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '3ab9c8e5-d460-481c-8a87-b9ead3af56dc'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '66ef277a-c198-4201-8ab2-7e321ce7a317'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'f4bea82e-5ff9-438f-9c8b-fbb32713cb0c'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'c969edbb-8ba4-4054-a826-468031aa4313'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '38eea6fb-4953-4ca7-84a6-b02f26ff8231'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '75b8609f-31a0-4db6-96ab-c60e69331b50'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'da75c673-97dc-47d9-a714-e815057e1196'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd89c0c13-97d1-4c78-860a-828c3d80dd38'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2312180e-bf72-41e1-9a00-1441eef133e2'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd2d7d6c3-3949-4db3-9a08-377515d5c62b'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '44365c02-93d3-4c90-96bb-7687e45fc1bb'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '453fb7bb-c2e3-41b6-b238-9cc9fa9078da'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '4b7f240a-4582-48c5-9c83-4064466cca7e'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '01146409-df94-4b50-aa05-f1ebcfd68b6a'),
(67, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2ef1d2fd-f666-4fce-b542-e13919089f03'),
(68, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '22145ec0-7d07-4160-8c06-3e0265a51523'),
(69, NULL, 'app', 'm171011_214115_site_groups', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b0ec3732-745b-478c-b4f6-2054da86e880'),
(70, NULL, 'app', 'm171012_151440_primary_site', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '47cbd1bf-8121-466c-88c8-7d7d8377399f'),
(71, NULL, 'app', 'm171013_142500_transform_interlace', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b06aecab-3b48-4acf-9ca7-6ba7e9dfb488'),
(72, NULL, 'app', 'm171016_092553_drop_position_select', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'f9c867e1-dac1-457a-9520-4e6295b34069'),
(73, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '87152e5b-ee72-49c9-bcce-8035f065cb56'),
(74, NULL, 'app', 'm171107_000000_assign_group_permissions', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '7cbce561-6893-4c7e-a48f-27c7b7a1b778'),
(75, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '414ae58d-b31f-42a8-b420-3d148492fcb7'),
(76, NULL, 'app', 'm171126_105927_disabled_plugins', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b6128c89-b1c5-4126-93f9-3e6ce239f526'),
(77, NULL, 'app', 'm171130_214407_craftidtokens_table', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '81c7818b-2a42-4f9d-bdc1-d4ee45c3b701'),
(78, NULL, 'app', 'm171202_004225_update_email_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '3523d8d5-07c8-4b28-9377-72faad3f985e'),
(79, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '9ce60020-4398-43fa-a75e-3ea39547585a'),
(80, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '1a789a50-2b6f-449f-bd5c-fe4801dd7949'),
(81, NULL, 'app', 'm171218_143135_longtext_query_column', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'e659dc76-6559-4c32-84e3-2e8430812529'),
(82, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'bcbcad4e-d82c-44df-8ed4-31713550d14c'),
(83, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '5f2bd303-6b08-43a7-b1de-bb8351ad6ba7'),
(84, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '083e87f4-17ef-4679-9ddf-1fdc25fe0d59'),
(85, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'fabefc66-a7f6-4784-b2b7-bf3bcb440600'),
(86, NULL, 'app', 'm180128_235202_set_tag_slugs', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '161237c8-f2d8-45b4-9069-c59d4390bd97'),
(87, NULL, 'app', 'm180202_185551_fix_focal_points', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '67881c1f-5bcc-4081-9f1d-7e75ea04cf71'),
(88, NULL, 'app', 'm180217_172123_tiny_ints', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'a61cecee-d5ca-4014-8b35-7db41914ba66'),
(89, NULL, 'app', 'm180321_233505_small_ints', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '1ef43b75-2bbd-480b-88b1-7babae640274'),
(90, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b99cfe09-7eb7-444d-8eb2-fff47fe832c9'),
(91, NULL, 'app', 'm180404_182320_edition_changes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '1c305975-170b-444b-bda3-73f5e465fb71'),
(92, NULL, 'app', 'm180411_102218_fix_db_routes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '906c02fd-66ed-4eb6-b3d7-4c9d80bdfd5d'),
(93, NULL, 'app', 'm180416_205628_resourcepaths_table', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '516f6ce1-41dc-4d43-b3c9-b01e5a5d702b'),
(94, NULL, 'app', 'm180418_205713_widget_cleanup', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '890fc324-45c6-43dc-8fee-7398349ced0c'),
(95, NULL, 'app', 'm180425_203349_searchable_fields', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '3bc6e7d4-41e8-4ce3-a8e0-74405117e6a8'),
(96, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '77058e61-3c43-4d9a-b16d-93f6f389f73f'),
(97, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '4af4c48b-8a8b-4fb0-b2b4-9bc15db39af1'),
(98, NULL, 'app', 'm180518_173000_permissions_to_uid', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '9cd362fd-2158-4af0-866b-bd0a83585b28'),
(99, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'bf248fc5-e58b-4d2d-bf5e-2af8036c5fec'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'eca46f52-41a1-4f71-a005-f76e98640153'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '67179288-45d1-4d8e-905a-58f0e4dab248'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '481738b1-4f54-45d3-ace0-6117dea51c4e'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '6e2e5781-0f13-4ee6-b2c4-99d2b4a69b9c'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'ea9504d0-f30f-44ee-af84-0cf9fc2ba553'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '48f0d11c-baed-4784-8a30-09a4bff92adf'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'b7516a38-a17e-4547-bb88-94855b89322e'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'e1168ab7-7e28-4321-a093-7f40220f3e14'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'c6a8256e-f73c-4978-92c9-568ce2e3fca7'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '8d6a4bd7-83fc-442e-befb-44639dbae9d9'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'd6a54733-6232-4704-bc73-d7bca8fa0fec'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'c9d10a0a-f9f8-4c8c-9c97-3a12fbed2daf'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'bac7abd5-0471-474a-83ff-9f5e9e0d8ead'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2fefc9f9-cf26-4003-8edc-7fa0f951e80b'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '4838be3e-f984-4bc9-a05c-653484796e23'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '8bbc65a0-b4ee-477b-b94a-9eb156d8a72c'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'ff2b1f71-d67e-48c4-ae61-3a04958a4fe4'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '4ccb07e7-a962-42ab-8208-b35284906d4e'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '433384a8-aeb8-440d-8dcf-9d04d9826f9e'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '3a660034-a9cc-437f-85a3-51b7adcedb40'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '30199186-f6fc-473d-8485-52a3ea860e67'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'c03e7877-ac64-41eb-b2c3-1b02da477537'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '55a124a5-802d-410d-b192-a89cacbde857'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '821a5aab-94e6-4e67-b748-d087a79445e6'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '483f43c3-dbce-48bf-b1b6-c6b73f66106a'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '939d116d-337e-4294-85cd-d4d8dce2d494'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '745695ca-290f-4fab-ab77-f0e270cf3235'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '6d28c856-caec-44d0-8e69-4f5f4ffb8ec6'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '24434882-c151-4c82-a287-0e898d807c14'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '61d227a5-f075-4d4b-b29f-65c26f9a69e4'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'e28207e3-705c-42b4-9fdb-6a9d12f8d3dc'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', 'ff359ebb-27ae-4b97-895c-6e460ef5f78d'),
(132, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '2019-01-27 21:35:58', '13d0410b-0ee9-4a90-8432-1c3b1a3d0024');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('1dbd075b', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\pluginstore\\dist'),
('1e27dd5f', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\dashboard\\dist'),
('21d2fc0c', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\utilities\\dist'),
('299f6762', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\jquery-touch-events'),
('303a0a0b', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\jquery-ui'),
('30506b1f', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\selectize'),
('3de3bb9', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\element-resize-detector'),
('45276f3c', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\xregexp'),
('484a5f0b', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\fabric'),
('6756f060', '@lib'),
('7733a76', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\login\\dist'),
('95339fec', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\recententries\\dist'),
('a6c4af5c', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\fileupload'),
('ab89dd82', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\updateswidget\\dist'),
('be4799b', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\velocity'),
('be71e641', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\craftsupport\\dist'),
('ca58601e', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\cp\\dist'),
('ccf9b674', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\d3'),
('cd6ca6bb', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\jquery.payment'),
('d8e42d57', '@bower/jquery/dist'),
('deae6d83', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\garnishjs'),
('eaaf637f', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\lib\\picturefill'),
('ee84cb57', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\feed\\dist'),
('f1c483df', 'C:\\GitHub\\STPHP\\craft\\vendor\\craftcms\\cms\\src\\web\\assets\\installer\\dist');

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' brent moxycompany com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'ITfb9lQ3z1zoXdwaTUztpVnM0ldtLY_Pt8OuOnxF7CE6mOD-MQlXkK_rgBiLNYXaTZHx4SiGJBaHOm8Oya_GNDOk7xUDaVIBiMog', '2019-01-27 21:38:59', '2019-01-27 21:47:34', '87b1ef51-d592-4ce0-8345-523f46c22957');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'St. Tammany Parish Pediatrics', '2019-01-27 21:35:57', '2019-01-27 21:35:57', NULL, '1a5079bb-c97b-45a2-bc2f-1ec6cd7eee4c');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'St. Tammany Parish Pediatrics', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2019-01-27 21:35:57', '2019-01-27 21:35:57', NULL, 'e21e108e-6a68-4988-92c8-1a0ad1ddde57');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'brent@moxycompany.com', '$2y$13$LhKcNo8q/BoQnq/s3VXiUeAChcA4VOCJO6/wsOo.T5i74ipsZSSb.', 1, 0, 0, 0, '2019-01-27 21:38:59', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2019-01-27 21:35:57', '2019-01-27 21:35:57', '2019-01-27 21:38:59', '6abba41e-4991-48a9-a14d-e469d263d394');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2019-01-27 21:38:59', '2019-01-27 21:38:59', 'e5524526-248e-4099-876d-f7faab1daa19'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2019-01-27 21:38:59', '2019-01-27 21:38:59', 'bc27b296-1167-4c95-888a-fea2ff394ac5'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2019-01-27 21:38:59', '2019-01-27 21:38:59', '4d6ce0b8-675f-4e3d-a329-d7770866de48'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2019-01-27 21:38:59', '2019-01-27 21:38:59', '0f3b3da8-056e-4ddc-bd77-09f052ebbe1a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `entryversions`
--
ALTER TABLE `entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entryversions_siteId_idx` (`siteId`),
  ADD KEY `entryversions_creatorId_idx` (`creatorId`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `globalsets_handle_unq_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entryversions`
--
ALTER TABLE `entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entryversions`
--
ALTER TABLE `entryversions`
  ADD CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
