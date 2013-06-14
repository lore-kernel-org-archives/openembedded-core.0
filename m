Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id CFD1A6A49F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 11:30:54 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so342156vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 04:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kQEzw2U2kQFJ1BD7RKHTDkPymatFrDZYsQoaYMnfEe4=;
	b=CCreN+twObqA+/e/5aWP9cZBkngje+gdg/ssaJOnv9jAgSa20qMDZQvZQO0baM71lz
	FSdQ4sNEc59UDmL1RMoccZ2exD7+LvILm6prGpIHsjQjJsJvb/WBFI5q8VnGyh/YqTCk
	i9/jfcWGa7iuIQ3oUM8lw+kUS2D8EjHg/ESM/E2Cdh9uO+REKu6pzQ8CfJnj5019iWlP
	3+jrTMSX8vtbK1VJFl5vBdCO4STHNBlg2O47p5oGxO46vXkVFAwhxP37TCoQMOL03+iL
	p/g/nHMjTRIKaCVGxcOVBMLlWqdlfk4EwPbczvKLZ8rxKsC2oyTsJ8IyYPEHcFnErChM
	m+gA==
X-Received: by 10.220.87.208 with SMTP id x16mr778810vcl.9.1371209455452; Fri,
	14 Jun 2013 04:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 14 Jun 2013 04:30:35 -0700 (PDT)
In-Reply-To: <51B9EEA2.1080205@linux.intel.com>
References: <1371029353-31833-1-git-send-email-ross.burton@intel.com>
	<51B9EEA2.1080205@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jun 2013 12:30:35 +0100
Message-ID: <CAJTo0LbQOB=cWzCVMGz4XvfqvQ1-jBCKC1gjutEM3B8MboWa=w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkNUuiJfxfgwZ8tOfAgoIHwQ2eYnQPUDmJJTPQLNk1vmQ8oPiByf7OLem7/E+zOAlqV16KP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: update install-quotaon-once.patch
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
X-List-Received-Date: Fri, 14 Jun 2013 11:30:55 -0000
Content-Type: text/plain; charset=UTF-8

On 13 June 2013 17:09, Saul Wold <sgw@linux.intel.com> wrote:
> This seems to not being applied correctly

I failed to backport to the release branch, stupid mistake.  V2 sent.

Ross

