Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id B4CEF6AEEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:00:15 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id jw11so1076991veb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 08:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ZzKUzunNLurnWpl7T8mSjyPVLU+n7eOGUQGOlJCtkUA=;
	b=UsSD7bjzU9GzmtBtoVVwDon5u2DvPdv4x3vxQUpK5jLthi2QWVMnAOS9hnUqVWMNwM
	gmEBGxG3ZsWri3tT6BJgXUlEAGrqpWb7Do1d/2wb9WJOvXWizyWD8BQg0ZorFylAXvTG
	UcoJLoxXhIH0/0EOnvz65nAZXQnRa1OaqoNG8IHvZwwWIhJC/l//aJXvwKKGTmgfbKio
	VXydA6jxBNzHmK3TWB5UnES2PTGggGwoHpLEcFnqrg0lZJY+QCymLH2eFx2SnZ522I1R
	cvSp4D+/u4K5s0EXSE+sw4iwPwbxs0Yhx2qIk8JobfSGDF8z+gcd4D9u0S7wSHyaIrlY
	85vQ==
X-Received: by 10.58.219.232 with SMTP id pr8mr3349636vec.80.1372950016554;
	Thu, 04 Jul 2013 08:00:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 07:59:56 -0700 (PDT)
In-Reply-To: <072c55d4b73deb36a97efb05280da2cb480d8885.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
	<072c55d4b73deb36a97efb05280da2cb480d8885.1372947733.git.radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 15:59:56 +0100
Message-ID: <CAJTo0LaFg=_oysGQ349tnt+_8iCr6L=ewy5D1TKTvr9NpwBFDQ@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQlwL14vyuzn0cNp9qTeW1LStJw2AORK1w12Fbn0Tx/sRuFO1D5nh7jeBObisLKfGHw1mZaW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/11] atk: Upgrade to v2.9.3
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
X-List-Received-Date: Thu, 04 Jul 2013 15:00:16 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 15:57, Radu Moisan <radu.moisan@intel.com> wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../atk/{atk_2.8.0.bb => atk_2.9.3.bb}             |    4 ++--

NAK, ATK is GNOMEy, so this is a development release.

Ross

