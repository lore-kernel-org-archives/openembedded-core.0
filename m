Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D5FC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 06:04:43 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 01/10] expat: fix CVE-2026-56403
To: openembedded-core@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 23:04:42 -0700
References: <20260717060437.2910653-1-deeratho@cisco.com> <20260717060437.2910653-2-deeratho@cisco.com> <DK2NGFYC221R.2ZGB7E3EHC3QX@smile.fr> <CY5PR11MB61878CA067B1DABD9ECA9294C4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB61878CA067B1DABD9ECA9294C4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
Message-ID: <1147544.1785477882048171566@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ILlGlDY3ORIy349DmgTN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 06:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242408

--ILlGlDY3ORIy349DmgTN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have rebased and sent you updated patches for expat package:
* [scarthgap][PATCH v2 01/10] expat: fix CVE-2026-56403 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242398 )
* [scarthgap][PATCH v2 02/10] expat: fix CVE-2026-56408 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242399 )
* [scarthgap][PATCH v2 03/10] expat: fix CVE-2026-56404 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242400 )
* [scarthgap][PATCH v2 04/10] expat: fix CVE-2026-56405 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242401 )
* [scarthgap][PATCH v2 05/10] expat: fix CVE-2026-56410 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242402 )
* [scarthgap][PATCH v2 06/10] expat: fix CVE-2026-56406 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242403 )
* [scarthgap][PATCH v2 07/10] expat: fix CVE-2026-56409 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242404 )
* [scarthgap][PATCH v2 08/10] expat: fix CVE-2026-56411 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242405 )
* [scarthgap][PATCH v2 09/10] expat: fix CVE-2026-56407 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242406 )
* [scarthgap][PATCH v2 10/10] expat: fix CVE-2026-56132 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/242407 )
Please review.

Regards,
Deepak

--ILlGlDY3ORIy349DmgTN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,</div>
<div>&nbsp;</div>
<div>I have rebased and sent you updated patches for expat package:</div>
<ol>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242398">[scarthgap][PATCH v2 01/10] expat: fix CV=
E-2026-56403</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242399">[scarthgap][PATCH v2 02/10] expat: fix CV=
E-2026-56408</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242400">[scarthgap][PATCH v2 03/10] expat: fix CV=
E-2026-56404</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242401">[scarthgap][PATCH v2 04/10] expat: fix CV=
E-2026-56405</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242402">[scarthgap][PATCH v2 05/10] expat: fix CV=
E-2026-56410</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242403">[scarthgap][PATCH v2 06/10] expat: fix CV=
E-2026-56406</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242404">[scarthgap][PATCH v2 07/10] expat: fix CV=
E-2026-56409</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242405">[scarthgap][PATCH v2 08/10] expat: fix CV=
E-2026-56411</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242406">[scarthgap][PATCH v2 09/10] expat: fix CV=
E-2026-56407</a></span></li>
<li><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/242407">[scarthgap][PATCH v2 10/10] expat: fix CV=
E-2026-56132</a></span></li>
</ol>
<div><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">Please review.</span></div>
<div>&nbsp;</div>
<div><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">Regards,</span></div>
<div><span style=3D"color: #333333; font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">Deepak</span></div>

--ILlGlDY3ORIy349DmgTN--

