Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8E96AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 16:14:29 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so1840640vbg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 09:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=CjBCbQfYlclMSK2eG+GqBw4UCSSFDdh1/KfjSk/zEU4=;
	b=iWxrdUWf82B1npByXty3N/DmoBq9eJG15EnSMBMPC9+UhpT7K93oFYtXARsv4O0Y7X
	HUweRzA69J0qs9KD29TkMGj6wrIdSYOh3hghvWUuOC81XwdCEQVJoqHITaBLOhaaLHGW
	UHKVr6p//NCtgg+TwZE6sGIENXeQR1aC/Jg2VYbdAtTqboABrZKy2LeeZSwTp78g1vpC
	vmVyAVGaznhnpVSTeOvSrnFdJzPwMzGG8MPkdpJQTF4ov1t4QOfxZXFkAl5o5+Ve00+j
	dOuG9TUwehrJyG5qLuiHfp13WCqKzrY+/clY6PEg9cq4iR6wTQb1LeDzpH2SlLVsOo97
	78kg==
X-Received: by 10.220.192.4 with SMTP id do4mr7304723vcb.91.1373040869747;
	Fri, 05 Jul 2013 09:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 5 Jul 2013 09:14:09 -0700 (PDT)
In-Reply-To: <2dd6fc349510f588eca1c5f24342cd4635d376d0.1373035497.git.radu.moisan@intel.com>
References: <cover.1373035496.git.radu.moisan@intel.com>
	<2dd6fc349510f588eca1c5f24342cd4635d376d0.1373035497.git.radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2013 17:14:09 +0100
Message-ID: <CAJTo0LZ6Rh=cvhW7PBxFmZWw4tKceKUPEdiKC+fcs5F9jz1vkA@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQk9Av+9MW964CaLq7fQF6kIF1v3udlhoB+F/2Jlvh/eVaa9lQMLngq6DAJInG3dyYXhCluR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] iputils: Upgrade to v20121221
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
X-List-Received-Date: Fri, 05 Jul 2013 16:14:29 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 15:47, Radu Moisan <radu.moisan@intel.com> wrote:
> -                    file://arping.c;beginline=1;endline=10;md5=ada2a6d06acc90f943bddf40d15e0541 \
> +                    file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \

Please explain the reason for this change in the commit message.

Ross

