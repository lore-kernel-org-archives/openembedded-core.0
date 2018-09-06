Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDE1E795D2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:38:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w86AcaKv013716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 6 Sep 2018 11:38:37 +0100
Message-ID: <9dfbfc68c611f9a6c1553ea1ea78fff15ea7c5cb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Andrej Valek
	<andrej.valek@siemens.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Sep 2018 11:38:36 +0100
In-Reply-To: <1a6e57df-433a-b7e4-cc6c-d6d8c1b0c43a@windriver.com>
References: <20180830155702.21700-1-andrej.valek@siemens.com>
	<d3d2454e-72d5-bf4d-351a-7ed1efe1a7f4@siemens.com>
	<fe5d1e09-7923-61e7-9bab-6238de83de8e@windriver.com>
	<1a6e57df-433a-b7e4-cc6c-d6d8c1b0c43a@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] busybox: update to 1.29.2
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
X-List-Received-Date: Thu, 06 Sep 2018 10:38:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 20:05 -0400, Randy MacLeod wrote:
Apparently, I need to learn how to handle base64 encoded patches
> since
> Richard managed to merge this to master today...
> 
> Ah, using patchworks does it for me.
> 
> FYI, just use the download link on:
>     https://patchwork.openembedded.org/patch/154457/
> as mentioned here:
>  
> https://stackoverflow.com/questions/5062389/how-to-use-git-am-to-appl
> y-patches-from-email-messages
> 
> I'd still prefer to only deal with clear text patches on the list.
> Baring that, one should be able to handle base64 encoded patches
> without patchworks in case anyone has read this far and knows how
> to do that...

Somehow my mail client is just handling the decoding magically for me
as the patches appear ok to me.

Cheers,

Richard



