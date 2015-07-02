Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 145B465CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 18:46:21 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so58350772qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 11:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FIVDJoe0LO9Y7tz5DwIjELchUMaYmq3hDPh6pKqa1Pc=;
	b=IkRBoIJbQ1xlcXqbh/KqMBXAI+IzdHHsqPsizuccOXj2EIT//ET50yJY0UxxvrE6+K
	3Rkt7iknLE4/poUGw2izcPY/od999gMmfskomWfnolQEJCrrmDlAn+QNWzGkwT215YiK
	WEgTgTrG3NKRbzZ8otnrjft9wPlJBhCo5nk3zFv5AL7rlHLAHvTp+wdAbq2rkMeZz1/D
	t9Cob0CaHWaQcQMn8sQC8ryY6SfgkR7cWWIF3V2skLmit0I0y1IdplyqRPRFvbrIAXXs
	wcoLhNJjuCYd8dP+ORrsPkok3WL3TcK1dIR7fPiHohIyiLpmm64V/v+I1SMUyObYdUIF
	8TPQ==
X-Gm-Message-State: ALoCoQmK8LCocero4HbQmNA491IUnYUdjKZw+Zu1pnn5DwxWOiJPVg8ktNV2aiDhL4Izs4LH2uA5
X-Received: by 10.55.18.197 with SMTP id 66mr48336171qks.13.1435862781122;
	Thu, 02 Jul 2015 11:46:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 11:46:01 -0700 (PDT)
In-Reply-To: <55956F2C.2040301@gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 19:46:01 +0100
Message-ID: <CAJTo0La4vOUHj6me+vw75u2AAdPvmGvJT8cx8wR_NP55AfE0=w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Thu, 02 Jul 2015 18:46:23 -0000
Content-Type: multipart/alternative; boundary=001a11474faa03edad0519e8db6f

--001a11474faa03edad0519e8db6f
Content-Type: text/plain; charset=UTF-8

On 2 July 2015 at 18:04, akuster808 <akuster808@gmail.com> wrote:

> The current version of nettle 2.7 has one file that is GPL v3.
> mini-gmp.*
>
> so the license for 2.7 should be updated IMHO. So wont that put us in the
> same boat as the upgrade?
>

Yes.  Ouch.

Ross

--001a11474faa03edad0519e8db6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 July 2015 at 18:04, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto=
:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":eg" class=3D"a3s" st=
yle=3D"overflow:hidden">The current version of nettle 2.7 has one file that=
 is GPL v3.<br>
mini-gmp.*<br>
<br>
so the license for 2.7 should be updated IMHO. So wont that put us in the s=
ame boat as the upgrade?<br></div></blockquote></div><br>Yes.=C2=A0 Ouch.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11474faa03edad0519e8db6f--
