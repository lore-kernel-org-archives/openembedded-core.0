Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (unknown [209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 08E2560167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 20:22:40 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id l6so4163629qcy.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 13:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7zbu7P6rb5e001mnQromxBsW0jDU4V8NQdOxKK+P0Ok=;
	b=WPrF5yidkwXVHnPjQyN4Z/iOmTnSa+HoXvEtd97kYrv0+jNaKrDlBWbIeM/dTTjPTe
	y/T3nRRL2zljQD+td4dwbnc0soWg+YCzOTw9/+xVFF1W1vhOdr5eNMVi3toVGG+lZYh2
	f/e0tyckEogZrzMRRuarHZnlUq+23Y9JmIczZ86RzeHLwoGtujJMQlFoPZv87CVdKMH4
	eiwTmgjBshVd12+OyK5Nvs2IwnDecvF7nNbr0dDkPS19lO8EXocE/76F6LRF6227Ew5v
	DSd1cRrQmtAKEWNVJ1N4KJVJGlnzBfzcuRJs+BGde9bS/v0UrEwkaU80EUZMakip6lgV
	Zn+w==
X-Gm-Message-State: ALoCoQmtz9qxODtpXCT7m/rNbkYkKXwzdVwq2zaO8p5cg3EL/eqNTozPo72kHNqcvxAVoshfxwZz
X-Received: by 10.140.25.37 with SMTP id 34mr68702601qgs.60.1400703761225;
	Wed, 21 May 2014 13:22:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 21 May 2014 13:22:21 -0700 (PDT)
In-Reply-To: <5d0d1d68d7277dbb1546e7d30be552149d5d02a4.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
	<5d0d1d68d7277dbb1546e7d30be552149d5d02a4.1400690725.git.valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 May 2014 21:22:21 +0100
Message-ID: <CAJTo0LZpg3V_knK-YsQA07F7eKTPc6RA2M+-NDQS74Ra=L2TBg@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] eglinfo: patched to compile with mesa10+
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
X-List-Received-Date: Wed, 21 May 2014 20:22:45 -0000
Content-Type: text/plain; charset=UTF-8

On 21 May 2014 17:50, Valentin Popa <valentin.popa@intel.com> wrote:
> +Upstream-Status: Pending

Pending here means "pending decision on whether it's
upstreamable/inappropriate", in this case it would be Submitted (with
that URL as the context).

Ross

