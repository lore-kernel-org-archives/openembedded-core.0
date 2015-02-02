Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2A32D6E5DE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:26:45 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q107so48433608qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 09:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cgRGwKVobBPqxmXy1UagakM18sNPtJF6rk6A1YMSUF8=;
	b=iymag5mJk7D+8uEPADJzLv0imIJxlD0DZHQeYXRdzHPGtXZOQ51bJO1yWS43dVDS+J
	pC93z4q9GiubOeJk1E79xMygkyXxXP8CsbkYYoFUJ+Naax6fxzSbNxqavK8klmugWcwv
	OW871wU3sqYxesbvACBpidV22qDHoWTsnbCyVygGnT9tvW7XsOSLQOOMMQn4I1rws4U8
	LK5pYS9PaBkEaWh9hSh/sv7mxNoZjc3iERsCnDsXF2jRCiihANbOgWvonU4vJV5V11kB
	YIyUmqMDQ6NkeJgcI0Q+DwVC3nTtBdxPHGxIGa7k9cl+XFqG2L5QZiFoQmojxiGKbIOz
	mIMA==
X-Gm-Message-State: ALoCoQl8JJSSyFVgjnpxG4DZRI2/s+0p0P6xlKcX9Brq4GT29+iihshq4yDBavU5FolkkkZ0PVAT
X-Received: by 10.140.21.48 with SMTP id 45mr41346017qgk.87.1422898006834;
	Mon, 02 Feb 2015 09:26:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 09:26:26 -0800 (PST)
In-Reply-To: <54CFA8A5.7090504@mvista.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<54CFA8A5.7090504@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 17:26:26 +0000
Message-ID: <CAJTo0LbhMAnd=TKhbWHhTsbca_bVSvtjLFsR6b_P5gsarO7AOg@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:26:51 -0000
Content-Type: multipart/alternative; boundary=001a11c129943fd6de050e1e420e

--001a11c129943fd6de050e1e420e
Content-Type: text/plain; charset=UTF-8

Armin,

On 2 February 2015 at 16:41, akuster <akuster@mvista.com> wrote:

> If I knew what "testing' entailed I would through some time at this.
>

"Please build your stuff with this glibc/gcc and check it still works".

Ross

--001a11c129943fd6de050e1e420e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Armin,</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 2 February 2015 at 16:41, akuster=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster@mvista.com" target=3D"_bla=
nk">akuster@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":55" class=3D"a3s" style=3D"overflow:hidden">If I knew what =
&quot;testing&#39; entailed I would through some time at this.<br></div></b=
lockquote><div><br></div><div>&quot;Please build your stuff with this glibc=
/gcc and check it still works&quot;.</div><div><br></div><div>Ross</div></d=
iv></div></div>

--001a11c129943fd6de050e1e420e--
