Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8b27-0002yQ-Rz
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 19:01:28 +0200
Received: by bke11 with SMTP id 11so7335083bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c5+CTWWD7TJWmERZMh92V4oPO7bwnZY5U1pKplL9UXw=;
	b=SJFNzmPkCU8rO56Bm5LnQ5O52UDLeHnuY7XSIDsYiv0EMMeKffOUwoxCDRexj/0Svq
	r+lW/4Jt1sobPrqIDGjs+lugmE4zVGQkSiLnlm4B6xUUpUkBvL69oaSIQsIU/X+e1MOo
	ffjYzEKiPpITjWrGXT0py3PF7TSRW0X7V0GAg=
MIME-Version: 1.0
Received: by 10.204.139.20 with SMTP id c20mr5801631bku.218.1317142562038;
	Tue, 27 Sep 2011 09:56:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Tue, 27 Sep 2011 09:56:02 -0700 (PDT)
In-Reply-To: <1317140351.26109.166.camel@ted>
References: <cover.1317131040.git.edwin.zhai@intel.com>
	<20110927140224.GA10415@edwin-gen>
	<201109271516.15542.paul.eggleton@linux.intel.com>
	<1317140351.26109.166.camel@ted>
Date: Tue, 27 Sep 2011 13:56:02 -0300
X-Google-Sender-Auth: mRm0RB1umE-4kS7O1oec2KTLddo
Message-ID: <CAP9ODKrRk81paUpo5pxY_ZxH_ee8cCCvkHbQJ5_607czGNeMZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] remove gnome-vfs completely
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
X-List-Received-Date: Tue, 27 Sep 2011 17:01:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2011 at 13:19, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> First step would be to move it whole to its own layer repo.

I think we can just remove them all and let the necessity tell us what
is really required.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


