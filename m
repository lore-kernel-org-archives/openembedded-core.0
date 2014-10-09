Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 70E0971758
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 13:25:48 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q107so1949172qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 06:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ewNuHpAyyr0Os/bnJII4GoH2xB8jzeuHo8QIAWxmMeg=;
	b=ho2axnLE0opdfYQzKMfvTxR174yk0Qe9Uw67T4IVTc0cdCUYjV3qL9AmpSmkkrVt2T
	j8kvZ4CiyfvW1Ii3U5uzHU86X4nnx52LZdKq6TCYNH7SGH0rZqhLn6BD5oFrvbThJOXp
	8De4guGfUhGkJBoApqld6P37DT3L8J7GsEsCgevTm3MuEicvDPsVN7uXhcqoubtNLCMA
	a9GCqUXJ1J9q4gWZ75m7lClZ4uUTTvOnWAbwjPLKSv3ZsQKTXpgZamAshbzdNWLG7SbQ
	0gHBQsX0Al+EyN/dreA2CzuVgd/f5wTKNkKnOW84iB7C0iEJYdU/a1flYBBz0a/qpq3s
	J8vQ==
X-Gm-Message-State: ALoCoQnpIedjZsdL9MNa3Qe41oqxAd/VE4MbQvOFt94nT4E/7MRjEGDbgmgNyGr/zjfkKFTT97KY
X-Received: by 10.140.84.84 with SMTP id k78mr36407281qgd.80.1412861149354;
	Thu, 09 Oct 2014 06:25:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Thu, 9 Oct 2014 06:25:29 -0700 (PDT)
In-Reply-To: <365E1805BC95084CBE82381A0B869994E7529E44@EU-MBX-01.mgc.mentorg.com>
References: <1411996493-29494-1-git-send-email-noor_ahsan@mentor.com>
	<365E1805BC95084CBE82381A0B869994E7529E44@EU-MBX-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Oct 2014 14:25:29 +0100
Message-ID: <CAJTo0LYmOa1vn6TW9MH3X55xwRGX2+gVNCjDMLRGYPUNpT7o-g@mail.gmail.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace: Add missing bison/flex depensencies.
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
X-List-Received-Date: Thu, 09 Oct 2014 13:25:56 -0000
Content-Type: text/plain; charset=UTF-8

On 9 October 2014 09:14, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> Any update on this patch?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b2637adf847d02c5c3e568937bd88459d45ae7f9

Ross

