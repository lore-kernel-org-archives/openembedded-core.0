Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SPL4c-0000K2-Sd
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 23:57:31 +0200
Received: by vcbfl13 with SMTP id fl13so3352403vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=3rd9NK3IuscU0S+o1ZEZDmkOdIgX/eyqDskvAkF+dSw=;
	b=oXV9U403OqpleBWjM1SfnB04FlT55tSVsatfB8D2EMuGfzkOnpHar9mfHEO3sS4TDK
	R85IhOSYrHeVWJm4tgpJnCkqtoPUkOGtSZa38VO/Nt6tp8igu++ThTzvrniLOipRKy6d
	Ya+Wy++j6yrcfzVGALmb7MVt/5EWN+mynsUHInPcNd5m0TUwHqXXG4htUp6aGxgBtR9G
	my8JT7NGHLqKT6ubDkfnkyAudk0u5Ut6Zled77jp8R4XI7i6GXfA36FD8tyNGY5RqkMS
	g3+FA+0UjcDlUl052F4Q6pva1HWvKbRoh0A33qGIJv9GzS21z+amMYL3x3b7Xb0R4Q+v
	riVw==
MIME-Version: 1.0
Received: by 10.220.224.68 with SMTP id in4mr18599664vcb.24.1335908866907;
	Tue, 01 May 2012 14:47:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.108.146 with HTTP; Tue, 1 May 2012 14:47:46 -0700 (PDT)
In-Reply-To: <4FA052CB.6050508@intel.com>
References: <4FA001F0.7010705@intel.com>
	<4FA052CB.6050508@intel.com>
Date: Tue, 1 May 2012 18:47:46 -0300
X-Google-Sender-Auth: E-NXD5ufrfk_C_-7Rxe5QHQna8g
Message-ID: <CAP9ODKpym3UOZGGhkjVH6UW3d8mGwijoPOCp9jAUq72MEgTLrQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto@yoctoproject.org
Subject: Re: Yocto Project 1.2.1 release plan.
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
X-List-Received-Date: Tue, 01 May 2012 21:57:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 1, 2012 at 6:16 PM, Scott Garman <scott.a.garman@intel.com> wro=
te:
> Sorry about this folks - my denzil-next branch was based on oe-core and n=
ot
> poky. So I've just deleted the branch and will be re-creating it shortly.

Grrrr :-(

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


