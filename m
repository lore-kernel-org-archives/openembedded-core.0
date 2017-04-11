Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9E77977C5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3B8LuUe018625; 
	Tue, 11 Apr 2017 09:21:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sf1yO9ELCqn9; Tue, 11 Apr 2017 09:21:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3B7K5ZR014158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 08:20:06 +0100
Message-ID: <1491895205.12091.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Zhou, Li" <li.zhou@windriver.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 08:20:05 +0100
In-Reply-To: <93eb1af8-d13b-e283-003c-409d2938c781@windriver.com>
References: <c2d859ac-be14-3464-2df2-090f72a02b76@windriver.com>
	<93eb1af8-d13b-e283-003c-409d2938c781@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH V2] python2/3: Move config/Makefile from core package to dev package
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
X-List-Received-Date: Tue, 11 Apr 2017 08:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Tue, 2017-04-11 at 13:31 +0800, Zhou, Li wrote:
>          From the mails I received, I think you have merged the 1st
> version of this patch, while I have sent out the 2nd version for
> fixing the issue mentioned by Jussi .
> I just sent this patch in an accessory, because there are lines which
> are too long to pass the auto tests (but they shouldn't be changed).
> So, please take a look at my 2nd patch in the accessory. Thank you.

Thanks for pointing that out, I've updated the version in -next.

Cheers,

Richard

