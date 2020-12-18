Subject: How to set the password Hashing Algorithm for root user to SHA256 or SHA512
To: openembedded-core@lists.openembedded.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.147.8)
X-Originating-Platform: Windows Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 12:30:19 -0800
Message-ID: <uzea.1608323419985389915.mRo2@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="PX8XcZGNSkdsRRzICmSd"

--PX8XcZGNSkdsRRzICmSd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The image I generated seems to use MD5 for root password hashing.
I understood this from the=C2=A0/etc/shadow file in the image., the file h=
as following line:

root:$1$b7X30f8f$au21weqL.9.ExM4N84AtA0:18614:0:99999:7:::

Is there an OE config I can change to change password hashing from MD5 to =
SHA256?

I am using Thud version.

--
Regards,
Sourabh

--PX8XcZGNSkdsRRzICmSd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The image I generated seems to use MD5 for root password hashing.<br />I un=
derstood this from the&nbsp;/etc/shadow file in the image., the file has fo=
llowing line:<br /><br />&nbsp; &nbsp; root:$1$b7X30f8f$au21weqL.9.ExM4N84A=
tA0:18614:0:99999:7:::
<div><br />Is there an OE config I can change to change password hashing f=
rom MD5 to SHA256?<br /><br />I am using Thud version.<br /><br />-- <br />=
Regards,<br />Sourabh</div>

--PX8XcZGNSkdsRRzICmSd--
