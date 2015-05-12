Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2A78D74028
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:54:23 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so5653193qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WU1QX0Pn8Noo0eIciNJ0FHq5IVdVj6Iydd/dFsxtLrE=;
	b=S/2zgBkXXUmfe2Aez8o/FTwVEwqwGUPr1N4JBbXpm+sLEhtcY/PZXkhfRVH9zSjIhs
	+N53xqqzu4BOu4Xics6s/Bwy7PuSWkxPNxpiDzkb1Z9AFFgQLVl6TRoirk5K2NpjaLhY
	GHDdChtUT/8fO1I6aN32zkD9/o2jnDGQxwohsfRMuSP1wsCeP7eNhb1LypjI6c814BCe
	2etcjbPHQLC1a8c9lLiWWmseMwErfh0FTBiMQmtmJuaf9Tpe2cGZKZLhAGUAn6VXfb3y
	2/ppYEBCD0S0AQFr0VDMsd7QAfPgpBoqS9XLxDyKf6lO9C3lklIX+WVSQnO4JeIbLykj
	hKyg==
X-Gm-Message-State: ALoCoQm/Jfk9Z4Na0wmtpFGTaL1FfgDsibFgxrgqAgEEK0MOvHqEzo7RQkAUfQtMqXgsGWyT/kGX
X-Received: by 10.140.235.77 with SMTP id g74mr21534163qhc.64.1431442464757;
	Tue, 12 May 2015 07:54:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 12 May 2015 07:54:04 -0700 (PDT)
In-Reply-To: <5551DA96.2090006@ADLINKtech.com>
References: <5540CCFD.1050604@ADLINKtech.com> <5551DA96.2090006@ADLINKtech.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 May 2015 15:54:04 +0100
Message-ID: <CAJTo0LbFN9Dh0uf5s3mBJ_yVybYdLF_w5eqiJvpvnx4WgrhQAg@mail.gmail.com>
To: Jens Rottmann <Jens.Rottmann@adlinktech.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2nd resend] powertop: Fix build for !uclibc - kindly respond
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
X-List-Received-Date: Tue, 12 May 2015 14:54:25 -0000
Content-Type: multipart/alternative; boundary=001a11354a00a1068a0515e3ab2d

--001a11354a00a1068a0515e3ab2d
Content-Type: text/plain; charset=UTF-8

On 12 May 2015 at 11:48, Jens Rottmann <Jens.Rottmann@adlinktech.com> wrote:

> Is there anything else I should do, any additional information I need to
> provide, anything I did wrong? Kindly respond.
>

If a patch is for a release branch, it's best to add eg [daisy] to the
subject line so that it gets noticed.

Ross

--001a11354a00a1068a0515e3ab2d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 May 2015 at 11:48, Jens Rottmann <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Jens.Rottmann@adlinktech.com" target=3D"_blank">Jens.Rottmann@adlinktec=
h.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4=
qq" class=3D"a3s" style=3D"overflow:hidden">Is there anything else I should=
 do, any additional information I need to provide, anything I did wrong? Ki=
ndly respond.<br></div></blockquote></div><br>If a patch is for a release b=
ranch, it&#39;s best to add eg [daisy] to the subject line so that it gets =
noticed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11354a00a1068a0515e3ab2d--
