Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3XsC-0004Sh-Bp
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 20:38:20 +0200
Received: by bke11 with SMTP id 11so771197bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7UNYnjm/DDmtE6DVC7XDKRqkXUv+ztfRWDmV3eSdpqI=;
	b=UslXccKtjwsxXLjj/nsIVh5Vm2go1ufNQRq4kHvV66a3+vjbBElgt512B8WcbIVFkr
	ugWth9U3G5Uc78X38bIMX3BUCtt/4FIid6dmaV2VP5QbN/wbnmSYmTEVZFvapOrHwX/i
	8VYUVg7PkHuGja0u9Zsv0oR1/BluEu5jrRsgE=
MIME-Version: 1.0
Received: by 10.204.157.8 with SMTP id z8mr1427515bkw.145.1315938790525; Tue,
	13 Sep 2011 11:33:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Tue, 13 Sep 2011 11:33:10 -0700 (PDT)
In-Reply-To: <1315934738.2519.126.camel@phil-desktop>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com> <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
	<1315655628.4368.14.camel@lenovo.internal.reciva.com>
	<1315933706.13526.11.camel@ted>
	<1315934738.2519.126.camel@phil-desktop>
Date: Tue, 13 Sep 2011 15:33:10 -0300
X-Google-Sender-Auth: kQHjaQDC1HxiCMCYaIAASfeSZDE
Message-ID: <CAP9ODKrSgJqnrAmdDiaPtXYGRL-_8JQ7OUZcx92_hJFA-nCjng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Tue, 13 Sep 2011 18:38:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2011 at 14:25, Phil Blundell <philb@gnu.org> wrote:
> Do you know how long it's likely to be before this release is complete
> and the tree is re-opened for development? =A0I'm a bit unclear what the
> process is for that.

Maybe we ought to use a 'next' branch for it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


