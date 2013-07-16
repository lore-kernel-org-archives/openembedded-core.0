Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 043B76B231
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 18:16:59 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e15so703805vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 11:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=VkB5QVH6oVwkR6Gi3S4f8xWw54HvDgp6cR2J+yL2f8s=;
	b=iKYTGiKwoulrAFJQv/PDjPlW5hFne5hRDvtiGp//UGxG9b72rpfdp0C70XOPAIK4Pl
	R4RAMQBqE4jyeWicM/V0jO+j9k8nnfVYEttgIoSaBa3U4u6acD7hbROXRHZZQGsNOApw
	fC5n1nFmtSYdtB6lsjyWWth6DVIMi7PDlyY3EsEG2bv+gZ6Cu+1v/gNAMRZVMrQIkvZv
	kfhm+scM/cMhtJp7eBX/3T+Sxg1/w5pWSb+KWq9Evxx3KhXFb8uBpMlem5pHhZJHVK5k
	Ir7vMmX8IwCAHJV3mei2bGOSYcHRCrM/cpnuYOXI/KYdmKI8gdIWUDANkEGVEthSIpAK
	Wcpw==
X-Received: by 10.58.181.225 with SMTP id dz1mr806701vec.95.1373998620204;
	Tue, 16 Jul 2013 11:17:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 16 Jul 2013 11:16:40 -0700 (PDT)
In-Reply-To: <cover.1373985134.git.sgw@linux.intel.com>
References: <cover.1373985134.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jul 2013 19:16:40 +0100
Message-ID: <CAJTo0Lb3JCmvWvWw9YPDqYa3px2Yd1-pv3TQLgQ71oMmE-wNJA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkgzS9FQMCIc8As5TPsZa6JGLire0YAbfrAVLJrGu8yFIzFBzpqHhYAqWzUGUusAiCYNo9o
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/17] Rebased C-Pull, needs review
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
X-List-Received-Date: Tue, 16 Jul 2013 18:17:00 -0000
Content-Type: text/plain; charset=UTF-8

> The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:
>
>   lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Acked-By: Ross Burton <ross.burton@intel.com>

