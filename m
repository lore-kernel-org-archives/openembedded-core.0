Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SensW-0006Zw-DU
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 15:44:56 +0200
Received: by dajt11 with SMTP id t11so976789daj.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cqTLoCwYfrSH0CZ6avIm5LimQyZb20BKBId3lhsASNk=;
	b=Q7gXbVqs579mmCT9k1LI6sGRk9kva4XqDgkFJq0apPMjfVtc6XteR7Eo0UiKReaGWQ
	TEDkxlVHg/KeJRDj8yQt+yCxJGY2GhYFcQMJUXEx72H4Rk/Q3keBE9QFVDlOGQx7hPAL
	2IR/n+bVyGMxJGCkw1OMsAKGOFBf+DVur0g14vC/+anL6HoFdp2S9h+Tw8u43Kap6UPO
	Op6Z0/UJzL+6SE8Kzj+sNj0rKHnY1Y50BqvGwWVv5Qrz4jTUf7f7WfcN8VfbowI4FCfw
	UolrllxUBVOEz/k4sqdR7fLjKznD+zRV1bReIkKvZPPbJAbCDkzQ1yL1vgZereSrP5+d
	Ngmg==
MIME-Version: 1.0
Received: by 10.68.227.67 with SMTP id ry3mr5396707pbc.158.1339594459218; Wed,
	13 Jun 2012 06:34:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Wed, 13 Jun 2012 06:34:19 -0700 (PDT)
In-Reply-To: <1339593545-14046-1-git-send-email-sbabic@denx.de>
References: <1339593545-14046-1-git-send-email-sbabic@denx.de>
Date: Wed, 13 Jun 2012 10:34:19 -0300
X-Google-Sender-Auth: ARUS1RObdmrM9ougOGxVpNzROUs
Message-ID: <CAP9ODKoqnr+P+TbQuGk2vMe-UJLtanfF2e8P-PUMwAaqV56F7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Added recipe for libconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 13:44:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2012 at 10:19 AM, Stefano Babic <sbabic@denx.de> wrote:
> +PR =3D "r0"

Please drop the PR when using r0 as this is the default.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


