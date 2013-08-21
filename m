Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id E90246B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 21:25:30 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oy10so847288veb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 14:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OCHJVQZVvSPkOzQAKm+wW0n077t/iAfMSbRQ19mwXG8=;
	b=VLjNExuD46DLgU3Vk7HNBZVdbcGZGFF9uX2GqTbu3/iWQ3rrjmv9ICXqvV07aWm5/q
	We9W19Uje/lMTVsGGDV+EweKsJ7i74k3cnSer02rfhtB1a0Z90y2o0QG+5fAMOVVomcp
	sTNYHZN43NEZVvcO8b0MbDJ3sxBeXcKTnT14Jpm3jlaTIUoPHq4oS8KHiiMKE6oZNuaT
	bQ02cWQZ9/DVcfJgAM4e9uvS194Q94OePd0BPWShTz95bckai2sTc8ViosXda5/KiUXN
	TwWv5S5vmRrtG0GJNb6ClhEuWgvW/Acen2h7xiEL7B5qzf2rnmzNIPQMDQwm2VuX9dTG
	6Czg==
X-Gm-Message-State: ALoCoQnVa3fLdvItoydbmQifN3EIAQ7/VwOpoHzPfFOoAq7eIJJa0NmXG/49UUQXrW0j5QCZuRlw
MIME-Version: 1.0
X-Received: by 10.221.55.4 with SMTP id vw4mr119615vcb.37.1377120331121; Wed,
	21 Aug 2013 14:25:31 -0700 (PDT)
Received: by 10.220.71.201 with HTTP; Wed, 21 Aug 2013 14:25:31 -0700 (PDT)
In-Reply-To: <1377119763-25684-1-git-send-email-jslater@windriver.com>
References: <1377119763-25684-1-git-send-email-jslater@windriver.com>
Date: Wed, 21 Aug 2013 22:25:31 +0100
Message-ID: <CAJTo0LZmvUu1H8e-DkeJzqk0AKjAF_UJK30RhUL_NKaCxN0qAA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Joe Slater <jslater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libpam: add PACKAGECONFIG data concerning audit
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
X-List-Received-Date: Wed, 21 Aug 2013 21:25:31 -0000
Content-Type: multipart/alternative; boundary=001a1133abf426566404e47bd019

--001a1133abf426566404e47bd019
Content-Type: text/plain; charset=UTF-8

On Wednesday, 21 August 2013, Joe Slater wrote:

> +# yes, no, depends, rdepends


We don't have inline comments explaining any other variables so please
don't explain this one (I admit its more complex than most, but its
increasingly common).

Ross

--001a1133abf426566404e47bd019
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br>On Wednesday, 21 August 2013, Joe Slater  wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">+# yes, no, depends, rdepends</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
</blockquote><div><br></div><div>We don&#39;t have inline comments explaini=
ng any other variables so please don&#39;t explain this one (I admit its mo=
re complex than most, but its increasingly common).</div><div><br></div>
<div>Ross<span></span></div>

--001a1133abf426566404e47bd019--
