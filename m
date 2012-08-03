Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SxDwK-0001WH-5m
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 11:13:00 +0200
Received: by ghbz2 with SMTP id z2so513909ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=x7PE9x8rdMpvzbxR7/uXfP+o61JVKqVAMOUD1RenHlc=;
	b=Z+q92sfGqD8TNKTdMZir3yb6/2b0yJ+THKLd6MAgX6MEYRwaVrH7T9aYbqBOeX06XV
	AfsAzH+fOl8MKLmsMGXeS9wZnKM36rAwHps8h97vZk6xu7egznRqQqWJ9jxOq9NHE5sJ
	3vmjIXvzaLfeaOSruZihcds+RW2nICd+sF9Ii85MArghw6ta1Rt8UmgGiUMVxJXFe22B
	pOevPfn1mjxZeWBtiK8ncB0OQ2FgUFQg9/pj5F+y+DghHkkpjy3vLtCiSAdgNFuIxc/z
	gZ/5mdDIFEUOFZOmmxG2ZWBlIpiHXnTPjV0yVklndvaxlaNDdFwzsDCUF7u4ih0Dv6fc
	jstg==
Received: by 10.50.195.234 with SMTP id ih10mr2198355igc.0.1343984478842; Fri,
	03 Aug 2012 02:01:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Fri, 3 Aug 2012 02:00:58 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <501B928D.7060003@intel.com>
References: <501B8F3A.8000309@intel.com>
	<CAK18fxFeUezS1VEfN+z24_0NYn7nn+w3p=HyDQ_EigJ8qForgw@mail.gmail.com>
	<501B928D.7060003@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 3 Aug 2012 12:00:58 +0300
Message-ID: <CAK18fxE+77-tQ75csXvRZi8w_Uu1a8p6cew-DUCKz8SzEfVXSg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn0ia/1Fhg23e6/n8ZZ02dCu5elYK0RqWy5DRlVCff7R/03noRY520/63KwYF7lSv6CdSSy
Subject: Re: while trying to update u-boot
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
X-List-Received-Date: Fri, 03 Aug 2012 09:13:00 -0000
Content-Type: multipart/alternative; boundary=14dae934125b71f0d504c658c5f1

--14dae934125b71f0d504c658c5f1
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 3, 2012 at 11:57 AM, Radu Moisan <radu.moisan@intel.com> wrote:

>  Sorry, my bad, I was trying to build u-boot-fw-utils and assumed wrongly
> that the recipe requires u-boot.inc
>
> It happens. No problem.

ag

--14dae934125b71f0d504c658c5f1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 3, 2012 at 11:57 AM, Radu Moisan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_blan=
k">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">


 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Sorry, my bad, I was trying to build u-boot-fw-utils and assumed
    wrongly that the recipe requires u-boot.inc<br><br></div></blockquote><=
div>It happens. No problem.</div><div><br></div><div>ag=A0</div></div>

--14dae934125b71f0d504c658c5f1--
