Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 319F975129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 09:26:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9P9QVmU028676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 25 Oct 2018 10:26:36 +0100
Message-ID: <3bc2e2156f4f5ba898584b9a89c1c331cec27209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 25 Oct 2018 10:26:30 +0100
In-Reply-To: <A6C49273-61A8-44B5-8E5C-65DE81A27B29@gmail.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-4-mark.hatle@windriver.com>
	<CAJTo0LY3gqvFDMzg48s0q4kZZ=WPpdj8u+jb-7gXFGmA-MBbPw@mail.gmail.com>
	<A6C49273-61A8-44B5-8E5C-65DE81A27B29@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] weston: Remove machine specific append
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
X-List-Received-Date: Thu, 25 Oct 2018 09:26:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-25 at 10:36 +0200, Alexander Kanavin wrote:
> As far as I know virglrenderer works rather well now, and we should
> take it into use. WebOS already has support for it. 
> https://lwn.net/Articles/767970/

Sure, but that is 2.7 at this point...

Cheers,

Richard


