Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SD9zY-0001ip-54
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:41:56 +0200
Received: by vbbfr13 with SMTP id fr13so1445978vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ku15WeWF7/YL/qnpY1J4wcz0iVnUyhmwgJa34xeb0HQ=;
	b=FmmkKI7s83Y0RpztucV6RbvJ38JRkuI9eabQmyKqW1Q6UTgeaGM8UjQopB2GEAc/Gx
	6uEDMRJGDpDWdrTW7Gp+VNb+9gp/ESw/TtvV69vS+ThjZyK2//X/SNfvsydwUJXeTs4b
	XqsMf3Iog0rKgtCikhSgc1GtZwUKEcv70qwnZOLIzLMZ8n5UO9OTL8M+1kPT/IKenfRr
	FoXVJ7L2HZLvsrP+ciTuoFnag2baZf7TbY/sXf1SR+2nnWj/A/zyms/7YC3z51k6awC3
	DBhQQWREjJPDn4zKzPYrrjjPcyUUAnNcS0/KS2ojK644AWCUZ+jgN+IbvDD/EE1rxEz4
	gyBw==
MIME-Version: 1.0
Received: by 10.52.175.138 with SMTP id ca10mr6707515vdc.114.1333006372114;
	Thu, 29 Mar 2012 00:32:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 29 Mar 2012 00:32:52 -0700 (PDT)
In-Reply-To: <4F740656.4010903@windriver.com>
References: <1332964015-1069-1-git-send-email-obi@opendreambox.org>
	<4F740656.4010903@windriver.com>
Date: Thu, 29 Mar 2012 04:32:52 -0300
X-Google-Sender-Auth: 96kK9NwkTZtgrM5lXl0cUQv0cq4
Message-ID: <CAP9ODKoVgKu8aKL+aKkOfV0PYetgTd+N0cMRsEKOS=mJFDZ7aw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: move from 4.8.0 to 4.8.1
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
X-List-Received-Date: Thu, 29 Mar 2012 07:41:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 03:51, Robert Yang <liezhi.yang@windriver.com> wrot=
e:
> If it is possible to enable them in oe-core, I'd like to send a patch for
> them.

If you're going to change it please do it in a separate patch to allow
easy revertion of it if need and to easy identification of this change
in SCM log

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


