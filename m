Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id D177773C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 13:40:07 +0000 (UTC)
Received: by igbud6 with SMTP id ud6so74803250igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pql/02punehr9cBztUoGZDtwqvTrsjZjJfb1KsSwMmw=;
	b=m2PeRBEsmnkHXiEoQtC4aGC38zYgqLsFPVwj0ATfyKQMF5MadhcuIzgierp8I45Ywm
	CZsYzQV2YVtKEfH/RR2JND6bMrsLGmtRvM1NfwXKTqYvvIwLzcsSVNZt43nZudqJWGM1
	QkUMdVcG+LfdRmCxNh8tIUG8J7gykdFtgLlVraq7rE4eCWgDP65VmJiRdsCJns5LWS2q
	FER4pT0XguC6SBdu09ApqG67aNo+DPpaQH4pJJ4JD4b0XGalPl4Qfiqp3bqanbiMV2b0
	eiwkqzNJVp0oQUTLej7GvDP54SaRYexBEiazQMRXMg1Ix290MBPrdEEBYU9j0gCUG9ui
	OkmA==
MIME-Version: 1.0
X-Received: by 10.42.67.19 with SMTP id r19mr36231888ici.30.1427722808225;
	Mon, 30 Mar 2015 06:40:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 06:40:08 -0700 (PDT)
In-Reply-To: <1427720735.17257.0.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-5-git-send-email-bruno.bottazzini@intel.com>
	<1427720735.17257.0.camel@bottazzini-ThinkPad-T430>
Date: Mon, 30 Mar 2015 10:40:08 -0300
X-Google-Sender-Auth: m6amJ5GOpU38BRp2fYbTgbgdYag
Message-ID: <CAP9ODKry4rL-yQkSJf_ar7GQUTJAZ+UbgWRXNFTtAWLE8K_qkQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd: v219 with stable fixes
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
X-List-Received-Date: Mon, 30 Mar 2015 13:40:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 10:05 AM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> Hello,
>
> What about this patch ?

What is this change in util-linux? Why this is necessary?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

