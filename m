Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 11C3971E7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 12:52:42 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so3969649qcw.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 05:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mn/50tp9zmvpucPFyvSX12Tw43eSMV6VDORtwiCrGws=;
	b=mw7ievIzoP/Ucb+msHXlnyFGGgr6BABnSRxu+C5okta7tHP4yhIbslRXiAs6VzPBpk
	ON4nRcnN8e/JfsWIt9CrGJN+RLJeAVKdRkFRIyMlXlkBsouUS3jk4q++Mq/ZVgGLgslM
	PyKBXp6qw8iEJgzK7z9CwwsWz77+Y2zliod8+Cb3aw2NmAFu/2M1mw3XLKmkHMc7YfdJ
	RRXdqqkUNIl4sCzIA1sGk9lvcLQEowPH9txPd9WVUILZhEb1KMH3kkXbZNKcd4WGjkxi
	KET6WVXJr5BPvcxV4hBnvB41PWVuLBSCpfOV9Q3QKHFeDlffAwCTjvz0SBQMnDA+yJdo
	Hj7Q==
X-Gm-Message-State: ALoCoQkIyNBvE0rsqjOoS2TNZe1PSgG5XtQ3TWkq5UjfYxrjyywfECOZdeskSQ1NzAS1fc656C0m
X-Received: by 10.224.160.83 with SMTP id m19mr14295981qax.17.1414414362697;
	Mon, 27 Oct 2014 05:52:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Mon, 27 Oct 2014 05:52:22 -0700 (PDT)
In-Reply-To: <544DA413.1000704@windriver.com>
References: <cover.1414142394.git.Chong.Lu@windriver.com>
	<764d0d5ee52d46b0b33d577675d8fecc3e99800f.1414142394.git.Chong.Lu@windriver.com>
	<CAJTo0LY-oHnKxUrtGUyhA=jPoK5Dcjs==7+YyVTV=6M5Jufesw@mail.gmail.com>
	<544DA413.1000704@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Oct 2014 12:52:22 +0000
Message-ID: <CAJTo0LbawpWU+=3m7CNF8mdxLPwD-Q82YuhVesvsx_=_j1NM=Q@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] curl: Security Advisory - curl - CVE-2014-3613
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
X-List-Received-Date: Mon, 27 Oct 2014 12:52:51 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aaa7bda405066701cd

--047d7bacb2aaa7bda405066701cd
Content-Type: text/plain; charset=UTF-8

On 27 October 2014 01:46, Chong Lu <Chong.Lu@windriver.com> wrote:

> This patch includes windows characters.
>

Ha, "thanks" git/email/etc.  Merged from the branch, thanks.

Cheers,
Ross

--047d7bacb2aaa7bda405066701cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 October 2014 01:46, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":15u" class=3D"a3s=
" style=3D"overflow:hidden">This patch includes windows characters.<span cl=
ass=3D""><br></span></div></blockquote></div><br>Ha, &quot;thanks&quot; git=
/email/etc.=C2=A0 Merged from the branch, thanks.=C2=A0</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=
=3D"gmail_extra">Ross</div></div>

--047d7bacb2aaa7bda405066701cd--
