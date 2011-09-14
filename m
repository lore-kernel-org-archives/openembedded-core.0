Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3ubF-0000WV-Jt
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:54:21 +0200
Received: by bke11 with SMTP id 11so1754527bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 11:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=azy9qwqvWzGsMn6IBgKrnh+C7GQVUqOtwOU4HU19gxw=;
	b=u+zVt1VT7jxFqw8uJ3nABJ0sSE6ZmD5lYoMdOKG8pNSd+NeyMvfn8FsN3ZSJeum7n3
	PG4h1wlIjfsW3kuQe7E9Ly5chykI0pIyYB40pPlubLMtFnsFSjDMcv6E5ljnBuAV5qq5
	wVWNgI/XegRMTU6yH+vmgfFvKx+Aqr7CmTjgc=
MIME-Version: 1.0
Received: by 10.204.146.155 with SMTP id h27mr87221bkv.353.1316026149940; Wed,
	14 Sep 2011 11:49:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 11:49:09 -0700 (PDT)
In-Reply-To: <1316025864.26879.2583.camel@elmorro>
References: <1316025864.26879.2583.camel@elmorro>
Date: Wed, 14 Sep 2011 15:49:09 -0300
X-Google-Sender-Auth: GkrAjnvbTfr27Ne5j-se3kfMHE8
Message-ID: <CAP9ODKopgP0rzqJPYYn9hvFX1wE_xJQFWd6ZfdGv7kjU8Endyw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add new recipes for grub2 [v4]
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
X-List-Received-Date: Wed, 14 Sep 2011 18:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 15:44, Tom Zanussi <tom.zanussi@intel.com> wrote:
> This patchset adds a new recipe for grub2 and an accompanying
> changes to initramfs-live-install.
>
> It's been preliminarily boot-tested with the meta-intel BSPs emenlow,
> and the legacy version (grub-0.97) was also tested with emenlow.
...

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


