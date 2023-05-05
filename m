Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F522C7EE21
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 02:34:11 +0000 (UTC)
Subject: Re: [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 May 2023 19:34:03 -0700
References: <202305041156063b4bf3fa@mail.local>
In-Reply-To: <202305041156063b4bf3fa@mail.local>
Message-ID: <6468.1683254043657162621@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="aoHuJaMGoY2DNDfNNMV8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 02:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180892

--aoHuJaMGoY2DNDfNNMV8
Content-Type: multipart/alternative; boundary="SnrRuqh6DkhZafFOZSL6"

--SnrRuqh6DkhZafFOZSL6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 07:56 PM, Alexandre Belloni wrote:

>=20
> All the whitespaces are missing fro the beginning of those two lines

Could you use the attachments and try again?

Thanks,
Qiu Tingting

--SnrRuqh6DkhZafFOZSL6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 07:56 PM, Alexandre Belloni wrote:<br />
<blockquote>All the whitespaces are missing fro the beginning of those two =
lines</blockquote>
<div class=3D"x_elementToProof" style=3D"border: 0px; font-variant-numeric:=
 inherit; font-variant-east-asian: inherit; font-variant-alternates: inheri=
t; font-stretch: inherit; font-size: 11pt; line-height: inherit; font-famil=
y: Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; fon=
t-kerning: inherit; font-feature-settings: inherit; font-variation-settings=
: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #000=
000;"><span class=3D"x_ContentPasted0 x_ContentPasted1" style=3D"border: 0p=
x; font-style: inherit; font-variant: inherit; font-weight: inherit; font-s=
tretch: inherit; font-size: medium; line-height: inherit; font-family: inhe=
rit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-sett=
ings: inherit; font-variation-settings: inherit; margin: 0px; padding: 0px;=
 vertical-align: baseline; color: inherit;">Could you use the attachments a=
nd try again?</span></div>
<div class=3D"x_elementToProof" style=3D"border: 0px; font-variant-numeric:=
 inherit; font-variant-east-asian: inherit; font-variant-alternates: inheri=
t; font-stretch: inherit; font-size: 11pt; line-height: inherit; font-famil=
y: Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; fon=
t-kerning: inherit; font-feature-settings: inherit; font-variation-settings=
: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #000=
000;" aria-hidden=3D"true">&nbsp;&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"border: 0px; font-variant-numeric:=
 inherit; font-variant-east-asian: inherit; font-variant-alternates: inheri=
t; font-stretch: inherit; font-size: 11pt; line-height: inherit; font-famil=
y: Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; fon=
t-kerning: inherit; font-feature-settings: inherit; font-variation-settings=
: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #000=
000;"><span class=3D"x_ContentPasted2" style=3D"border: 0px; font-style: in=
herit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; =
font-size: medium; line-height: inherit; font-family: inherit; font-optical=
-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; fo=
nt-variation-settings: inherit; margin: 0px; padding: 0px; vertical-align: =
baseline; color: inherit; display: inline !important;">Thanks,</span><br cl=
ass=3D"x_ContentPasted2" style=3D"font-size: medium;" aria-hidden=3D"true" =
/><span class=3D"x_ContentPasted2" style=3D"border: 0px; font-style: inheri=
t; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font=
-size: medium; line-height: inherit; font-family: inherit; font-optical-siz=
ing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-v=
ariation-settings: inherit; margin: 0px; padding: 0px; vertical-align: base=
line; color: inherit; display: inline !important;">Qiu Tingting</span></div=
>

--SnrRuqh6DkhZafFOZSL6--

--aoHuJaMGoY2DNDfNNMV8
Content-Type: application/octet-stream; name="0001-Fix-error-SRCDIR-when-using-usrmerge-DISTRO_FEATURES.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-Fix-error-SRCDIR-when-using-usrmerge-DISTRO_FEATURES.patch"

RnJvbSAzYjFjMDgxZDRlZmZmZTgzZjNhNjMxODQ0NTBjYzc5YmYxNjM1NmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBRaXUgVGluZ3RpbmcgPHFpdXR0QGZ1aml0c3UuY29tPgpEYXRl
OiBUaHUsIDI3IEFwciAyMDIzIDE1OjI0OjM1ICswODAwClN1YmplY3Q6IFtQQVRDSCBWMl0gRml4
IGVycm9yIFNSQ0RJUiB3aGVuIHVzaW5nIHVzcm1lcmdlIERJU1RST19GRUFUVVJFUwoKV2hlbiBi
dWlsZCBlMmZzcHJvZ3MgcHRlc3Qgd2l0aCB1c3JtZXJnZSBESVNUUk9fRkVBVFVSRVMsCmluIHRl
c3Rfc2NyaXB0IGFuZCB0ZXN0X29uZSBzY3JpcHRzLCB2YWx1ZSBvZiBTUkNESVIgaGFzIHByb2Js
ZW0uCiAgU1JDRElSPS91c3IvdXNyL2xpYi9lMmZzcHJvZ3MvcHRlc3QvdGVzdAoKcHRlc3QgbG9n
CiAgIyBwdGVzdC1ydW5uZXIgZTJmc3Byb2dzCiAgU1RBUlQ6IHB0ZXN0LXJ1bm5lcgogIDIwMjIt
MTItMTdUMTE6MDgKICBCRUdJTjogL3Vzci9saWIvZTJmc3Byb2dzL3B0ZXN0CiAgbHM6IGNhbm5v
dCBhY2Nlc3MgJy91c3IvdXNyL2xpYi9lMmZzcHJvZ3MvcHRlc3QvdGVzdC9bYS16QS1aXV8qJzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogIC4vdGVzdF9zY3JpcHQ6IGxpbmUgNTQ6IC91c3Iv
dXNyL2xpYi9lMmZzcHJvZ3MvcHRlc3QvdGVzdC90ZXN0X3Bvc3Q6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKICBEVVJBVElPTjogMAogIEVORDogL3Vzci9saWIvZTJmc3Byb2dzL3B0ZXN0CiAg
MjAyMi0xMi0xN1QxMTowOAogIFNUT1A6IHB0ZXN0LXJ1bm5lcgogIFRPVEFMOiAxIEZBSUw6IDAK
ClJlYXNvbgogIEluIE1ha2VmaWxlLmluLCBTUkNESVIgaXMgc2V0IGJ5IHByZWZpeCBhbmQgbGli
ZGlyLgogICAgQGVjaG8gIlNSQ0RJUj0ke3ByZWZpeH0ke2xpYmRpcn0vZTJmc3Byb2dzL3B0ZXN0
L3Rlc3QiID4+IHRlc3Rfb25lCiAgICBAZWNobyAiU1JDRElSPSR7cHJlZml4fSR7bGliZGlyfS9l
MmZzcHJvZ3MvcHRlc3QvdGVzdCIgPj4gdGVzdF9zY3JpcHQKICBwcmVmaXg9L3VzcgogIGxpYmRp
cj0vdXNyL2xpYiAod2hlbiB1c3JtZXJnZSBpcyBzZXQpCgpzb2x1dGlvbgogIEFmdGVyIHB0ZXN0
IGNvbXBpbGluZywgY2hlY2sgYW5kIG1vZGlmeSBTUkNESVIgaW4gdGVzdF9zY3JpcHQgYW5kIHRl
c3Rfb25lLgoKU2lnbmVkLW9mZi1ieTogUWl1IFRpbmd0aW5nIDxxaXV0dEBmdWppdHN1LmNvbT4K
LS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjAuYmIg
fCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcuMC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcuMC5iYgppbmRleCAyNjIw
NjEwOTAzLi5hMmViNGY4ZjhmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJm
c3Byb2dzL2UyZnNwcm9nc18xLjQ3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Uy
ZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4wLmJiCkBAIC0xMjIsNiArMTIyLDkgQEAgUkRFUEVORFM6
JHtQTn0tcHRlc3QgKz0gImUyZnNwcm9ncy1iYWRibG9ja3MgZTJmc3Byb2dzLWR1bXBlMmZzIGUy
ZnNwcm9ncy1lMmZzY2sKIAogZG9fY29tcGlsZV9wdGVzdCgpIHsKIAlvZV9ydW5tYWtlIC1DICR7
Qn0vdGVzdHMKKwlzZWQgLWkgJ3MsL3Vzci91c3IsL3VzcixnJyBcCisJICAgICR7Qn0vdGVzdHMv
dGVzdF9vbmUgXAorCSAgICAke0J9L3Rlc3RzL3Rlc3Rfc2NyaXB0CiB9CiAKIGRvX2luc3RhbGxf
cHRlc3QoKSB7Ci0tIAoyLjI1LjEKCg==

--aoHuJaMGoY2DNDfNNMV8--

