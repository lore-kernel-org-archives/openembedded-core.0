Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0707771AD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 20:35:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7LKZ6fN001157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 21 Aug 2017 21:35:07 +0100
Message-ID: <1503347706.32591.66.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 21:35:06 +0100
In-Reply-To: <1fbcbc75-bdab-bcac-65f6-7595854b2426@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<2e63bf95e8a5288464d90567260047217a3617d0.1501494496.git.liezhi.yang@windriver.com>
	<1502206246.18633.250.camel@linuxfoundation.org>
	<9e608de9-0ccb-c576-875c-d174e0070f5c@windriver.com>
	<1fbcbc75-bdab-bcac-65f6-7595854b2426@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 21 Aug 2017 21:35:07 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 01/10] oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
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
X-List-Received-Date: Mon, 21 Aug 2017 20:35:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-21 at 16:02 +0800, Robert Yang wrote:
> Ping.

Can you repost this series please? I suspect you've changed the patches
as per the feedback from Paul but I'd like to see another round of
review before we consider this.

Just repushing is fine for minor changes but more significant things
should be resubmitted.

Cheers,

Richard

