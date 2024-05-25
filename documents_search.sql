/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : documents_search

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-05-25 19:14:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_user_id_foreign` (`user_id`),
  CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO `documents` VALUES ('4', 'teste 31', 'documents/DuGWccCsLrNdbhr87a2nxkUqrUNzdnSfytnzoCqt.txt', 'Plataforma de Corretores Éobox - Step Jobs\r\n\r\n- Projeto no LARAVEL {ok}\r\n- Definir telas (Componentes) que usaremos do dashboard (Escolher qual versão do Hyper) {ok}\r\n- implementar o Laravel Mix no css e js do dashboard {ok}\r\n- Arquivo Sass (ou css) de alteração de css (caso necessario) separado. {ok}\r\n- migrar definições de telas iniciais para o blade {ok}\r\n\r\n- Componente Login \r\n   - login {ok}\r\n   - logout {ok}\r\n   - esqueceu senha {ok}\r\n   \r\n- Definição de escopo Usuario  (telas e recursos)\r\n- Modulo de usuarios\r\n  - Crud  {ok}\r\n  - Nivel de acesso (admin, equipe, suporte, empresa, corretor) {ok}\r\n  - soft delete {ok}\r\n  - paginação {ok}\r\n  - pesquisa (por empresa ou corretor) {ok}\r\n  - controle de acesso (empresa pode ativar ou desativar corretores) {ok}\r\n  \r\n- Definição de escopo Peças  (telas e recursos)\r\n  - criação de peças\r\n	1)	Facebook / Instagram {ok}\r\n		a.	Imagem de Post {ok}\r\n		b.	Carrossel {ok}\r\n		c.	Stories {ok}\r\n	2)	WhatsApp\r\n		a.	Imagem compartilhamento {ok}\r\n		b.	Imagem Status {ok}\r\n	3)	Linkedin\r\n		a.	Imagem de Post {ok}\r\n		b.	Stories {ok}\r\n	4)	E-mail MKT (Download do HTML ou Link para incorporar em ferramentas) {ok}\r\n	5)	Banners\r\n		a.	300x250\r\n		b.	728x90\r\n		c.	250x250\r\n		d.	300x600\r\n		e.	1500x500\r\n		f.	Dimensões abertas (cliente escolhe as dimensões na criação da peça)\r\n	6)	Vídeo (Personalização de uma cartela com os dados do corretor) – Ex.: https://www.youtube.com/watch?v=4hWblkX6d_A\r\n	7)	Outras peças sem personalização, para o cliente utilizar somente como repositório.\r\n		Lembrando que todas as peças devem ter o mock-up de aplicação para visualização.\r\n  - Crud\r\n  - ativar ou desativar peças (apenas empresas)\r\n  - paginação\r\n  - pesquisa (por empresa ou corretor)\r\n  - tipos de peças (fecebook, linkedin etc)\r\n  - tipos de postagem (	Promocional/Oferta, Apresentação/Novidades, Divulgação de Evento, Institucional, Conteúdo)\r\n  - preview da peças (mockup do facebook)\r\n  - historico de peças geradas \r\n  \r\n     - modulo de campanha (\"anexar\" varias peças á uma campanha com data inicial e final e fornecer para os corretore apenas fazerem o download)\r\n	 - crud \r\n	 - paginação\r\n	 - pesquisa\r\n	 - ativar e desativar campanha\r\n	 \r\n	 - modulo de geração de peças\r\n	   - definição de escopo para cada tipo de peças (iu/ix)\r\n	   - preview da peças (mockup do facebook)\r\n	   - testes com componente Laravel\r\n	   - teste de otimização com classe resize\r\n	   - trazer peças geradas para o corretor (evitar criar peças desnecessárias)\r\n	   - minhas peças geradas\r\n	   \r\n- Definição de escopo do \"Assistente virtual\" (recursos iniciais)\r\n  - assintente para empresas\r\n  - assistente para corretores\r\n  \r\n- Definição de escopo para central de notificação (recursos iniciais)\r\n  - Para empresas {ok}\r\n  - Para corretores {ok}\r\n \r\n- Definição de escopo para suporte (recursos iniciais) \r\n  - Para empresas\r\n  - Para corretores\r\n  \r\n- Definição de escopo para faq (recursos iniciais) \r\n  - crud\r\n  - criação de views  \r\n  \r\n- Definição de escopo para dashboard \r\n  - admin, equipe , suporte\r\n  - empresas --> estatistica, informações, recursos e serviços\r\n  - corretores --> informações, recursos e serviços\r\n  \r\n  Banco de Dados\r\n  \r\n  - Usuario (main)\r\n	nome, email, phone, address, company(id), facebook, instagram, linkedin, site, link(googlemaps), status, level(id), password, term\r\n  - empresa\r\n    nome, street, state, city, address, status,\r\n  - Acessos\r\n	nome, level\r\n  - Peças\r\n   nome, company(id), user(id),\r\n  - Imagem Peças (pivo)\r\n  - Corretores (definir nome... tabela de peças geradas)\r\n  - Suporte\r\n  - Notificação\r\n  - Assistente\r\n  - Faq\r\n --------------------------------------------------\r\n  composer update\r\n  composer dump-autoload\r\n\r\n  php artisan migrate:fresh --seed\r\n  php artisan config:clear\r\n  php artisan cache:clear\r\n  php artisan optimize:clear\r\n  php artisan clear:data\r\n  php artisan view:clear\r\n  php artisan route:clear\r\n  php artisan clear-compiled\r\n\r\n  php artisan --version\r\n  \r\n  php artisan storage:link\r\n  \r\n  //importar email\r\n  php artisan make:mail SupportSend\r\n  //copiando templates de email\r\n  php artisan vendor:publish --tag=laravel-mail\r\n	\r\n	cp .env.example .env\r\n   --------------------------------------------------\r\n  ftp homolog\r\n  http://homolog.eobox.com.br/public\r\n  HOST ftp://177.234.153.17\r\n  PORT 21\r\n  USER u540280358.homolog.eobox.com.br\r\n  PASS eobox@SECRET123\r\n  \r\n  homolog banco\r\n  banco u540280358_eobox\r\n  user  u540280358_usrbox\r\n  pass  !eobox@SECRET123\r\n  \r\n  --------------------------------------------------\r\n  jwt\r\n        // $this->authorize(\'update_user\');\r\n        // $AuthToken =  JWTAuth::toUser();\r\n        // $AuthToken =  Auth::guard(\'api\')->user()->currentCompany()->first();\r\n        // Auth::user()->currentCompany()->first()->id\r\n        //$token = JWTAuth::getToken();\r\n        // $apy = JWTAuth::getPayload($token)->toArray();\r\n        // $apy = JWTAuth::parseToken()->authenticate();\r\n        //$apy = JWTAuth::parseToken()->getPayload();\r\n  --------------------------------------------------\r\n  trata select quando categoria selecionado nao tiver campanha cadastrada\r\n  \r\n  account tinymce\r\n  maicon.mendonca@newton.ag\r\n  New@2021\r\n  \r\n  http://eobox.local/invite/register/eobox/maiconcabral.mcm@gmail.com/98746541321\r\n  \r\n  http://eobox.local/access/eobox/maiconcabral.mcm@gmail.com/98746541321\r\n  http://eobox.local/access/eobox/Usuario-Eobox1@empresa.com/98746541321\r\n  \r\n  \r\n  root@ip-172-31-29-199:/var/www# chwon -R ubuntu html/\r\n  ------------------------------\r\n  email eobox\r\n  maicon.mendonca@eobox.com.br\r\n  Eobox@2023#\r\n  \r\n  \r\n  senhas\r\n  roberto\r\n  $2y$10$yJsZEkXYYUbV5Ee039RZD.ZoTVq6pDtGnXkn3bWVaQ5CDF6K1oMWi\r\n  \r\n  Alan\r\n  $2y$10$6lLt34LXZHb8Kd.mrZYbDuwMDzuBSP2MAm.9QckPyvlqfxPYl5AOy\r\n  \r\n  Giovanna\r\n  $2y$10$raefNvQ/hfRB.Jf5U5lI8OAXlYaUnr2NjrR0QSlMDhcpqNhkfqkRy\r\n  \r\n  \r\n  ederson.silva@universal-assistance.com', '1', '2023-06-22 12:41:29', '2023-06-22 12:41:29');
INSERT INTO `documents` VALUES ('5', 'Aristoteles', 'documents/ngQ4qZKnv9C85J50mnudDe2r6hCq7O0Zdkt2uge3.txt', 'Well begun is half done. - Aristotle', '1', '2023-06-30 20:31:51', '2023-06-30 20:31:51');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_12_14_000001_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('5', '2023_06_19_114331_create_documents_table', '2');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Maicon', 'maiconcabral.mcm@gmail.com', null, '$2y$10$7YOkTPLzbLgCTwjgJA0zOO/mQpKLoGqYzNpcC.tKkK9OZE7O3vPEG', null, '2023-06-19 11:41:33', '2023-06-19 11:41:33');
INSERT INTO `users` VALUES ('2', 'Miguel', 'miguelqueiroz@gmail.com', null, '$2y$10$7971UXo2EkNgYpVSuZMpoehLDUP/7JCD6qDn6e5UhFXgWESVJ94PG', null, '2023-07-05 22:16:17', '2023-07-05 22:16:17');
