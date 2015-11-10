Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB8274197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:49:18 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZwAEO-0002le-74; Tue, 10 Nov 2015 15:49:17 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 10 Nov 2015 15:47:46 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
References: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
	<1447145447-5678-1-git-send-email-adrian.ratiu@ni.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <564203DB.4070709@topic.nl>
Date: Tue, 10 Nov 2015 15:48:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447145447-5678-1-git-send-email-adrian.ratiu@ni.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw07ZNIPPkZ3Ij4B+6ceaAPgMW+bc4ELTOFobIvuIgRtUwzAyxKN60avVXy233+ea8jCQ
	6BGCUk6lesIe6WezhycvCnwFADxF31bb83YzSO/N6dNpaVpHypAvheky9nY1Ark4JWroVrMJ1uUg
	wic/adPpClvil/bONy/i8NDPp38dH5HloJ110bgr/JHWg2hjD3LsgzFQiQkh92Z5qO7AxZwo/2wS
	dzaMnqQPmKhRVZZzPd0rEuGjFyZoidhtHm+WoWc+GHy8ozQ6nOhpnNOPKHGe2nQ7pxaMZY8X4Sye
	d8nS9R/2gMGq0KWAzmMf+ibVDuWeCgFUDUk0IpENzuwQ9AXV2kebskIad1cfruBj8qFvopGfjHng
	sgmfVBFZ2RbekqR9Sm8ZZj3WwN4q40J+sX/YYFhHX0VF9hJ81sOodoipp7FiDM3ZqWvUJ2i/D6oV
	CWUVrBsPGnNiJ83AD/4JscCDmOO9kT7VY+NDmCLEo61s/JpkAWbZWodT9LTFUfIpCN7elaUbKFPW
	RTLcl9CdqGriggoPQcG3ixasQiUTxUlqVgW9/bktU41htiJ8fk7NkA0DDFbYC82S1xHEqATOcSkf
	nRhgcTf/T0jiD+JFB5x+L6itN5EQNRtERw+477u94vzk0tkD4YVPkEVB+uCJQnhxe7td1tXC+HXF
	Zpn7LZgW
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: [PATCH v2] util-linux: create util-linux-runuser package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 14:49:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 10-11-15 09:50, Ioan-Adrian Ratiu wrote:
> Split runuser into its own package (previously provided by util-linux).
> Since runuser is compiled only when DISTRO_FEATURES includes pam,
> the creation of util-linux-runuser is also constrained by this.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 594108f..dc460e7 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -34,6 +34,7 @@ PACKAGES =3D+ "util-linux-agetty util-linux-fdisk util-=
linux-cfdisk util-linux-sfd
>                util-linux-partx ${PN}-bash-completion util-linux-hwclock =
\
>                util-linux-findfs util-linux-getopt util-linux-sulogin"
>   PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'uti=
l-linux-pylibmount', '', d)}"
> +PACKAGES =3D+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linu=
x-runuser', '', d)}"
>
>   PACKAGES_DYNAMIC =3D "^util-linux-lib.*"
>
> @@ -85,6 +86,7 @@ FILES_util-linux-partx =3D "${sbindir}/partx"
>   FILES_util-linux-hwclock =3D "${base_sbindir}/hwclock.${BPN}"
>   FILES_util-linux-findfs =3D "${sbindir}/findfs"
>   FILES_util-linux-getopt =3D "${base_bindir}/getopt.${BPN}"
> +FILES_util-linux-runuser =3D "${sbindir}/runuser"
>
>   FILES_util-linux-pylibmount =3D "${libdir}/${PYTHON_DIR}/dist-packages/=
libmount/pylibmount.so \
>                                  ${libdir}/${PYTHON_DIR}/dist-packages/li=
bmount/__init__.*"
> @@ -106,7 +108,9 @@ RREPLACES_util-linux-blkid =3D "e2fsprogs-blkid"
>   # reset calls 'tput'
>   RDEPENDS_util-linux-reset +=3D "ncurses"
>
> -RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-linux-lo=
setup util-linux-sulogin"
> +RDEPENDS_util-linux-runuser +=3D "libpam"
> +
> +RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-linux-lo=
setup util-linux-sulogin util-linux-runuser"

I think that will need to be conditional. Without pam, you won't be able to=
=20
install util-linux because of the missing util-linux-runuser dependency.

>   RRECOMMENDS_${PN} =3D "util-linux-fdisk util-linux-cfdisk util-linux-sf=
disk util-linux-mount util-linux-readprofile util-linux-mkfs "
>
>   RRECOMMENDS_${PN}_class-native =3D ""
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at : Aerospace Electrical Systems Expo Europe which will be held f=
rom 17.11.2015 till 19.11.2015, Findorffstrasse 101 Bremen, Germany, Hall 5=
, stand number C65
http://www.aesexpo.eu



