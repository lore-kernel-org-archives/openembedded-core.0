Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3F57026E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 22:31:04 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so1406090qcy.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W+phTfKY5CyxthkrNdJWjkv6nMmYvLTCJ6eWH7k9KfM=;
	b=QmhIsGwDGtnwzVFW0ga1hXT3aP5DuihdVZy6twbmgR2L5qNG/C04iVbpw1wkrm/RDP
	AZqsigkBNffhHELCBjBz7o+Q5aAncXvWhPzmbCqbnzelv59x8Gns6EihjNjPiMJ1l/Q8
	wNz3qFWGnyMGkW23TnRulI9IjhzgW2xPsipM52v2IjGzX4pmDemOmllX0/gaHanxPVtE
	C+kPON9foKfCTkm5de+LdW0EyW8kDKppXkRkU4aERNpNeDkAt3BlauHUp5pa3Ne9Tzbd
	CRMlfTQllP3j3jbA+p3mz8Yppg1gQuN1WKQIeqXtuZ4FdYqVlrjsqoXOaJP05Z8LkRtR
	Y6vQ==
X-Gm-Message-State: ALoCoQkgoSIubJNJbddlSPTxJ1aCHRX9KeDaiLaNvb/czby25uZuxXsyMgc+GEUAXG1RCo8P9qqp
X-Received: by 10.224.43.77 with SMTP id v13mr2412800qae.34.1405549865487;
	Wed, 16 Jul 2014 15:31:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 16 Jul 2014 15:30:45 -0700 (PDT)
In-Reply-To: <53386c9bab6af2fd79b9816e82566b220a1e99ae.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
	<53386c9bab6af2fd79b9816e82566b220a1e99ae.1405527926.git.richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 23:30:45 +0100
Message-ID: <CAJTo0LbGMb_v-aUQ2JHJcAxRr3qY39JcUmS+ziY21N+oTeyNiw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/19] python-scons: Upgrade 2.3.0 -> 2.3.2
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
X-List-Received-Date: Wed, 16 Jul 2014 22:31:12 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2014 17:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98e9a1e6029e715255c52032a1eba637"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ad8a74a10870caa5e08a3e45d719e2"

Why did the checksum change?

Ross

