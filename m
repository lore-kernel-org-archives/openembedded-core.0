Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 83433719A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:43:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3H6hJ9W012249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 17 Apr 2017 07:43:21 +0100
Message-ID: <1492411399.19076.58.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dengke Du <dengke.du@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 07:43:19 +0100
In-Reply-To: <2f2ca19a-5af9-aa71-23bc-c2d30ea43445@windriver.com>
References: <1491876119-195521-1-git-send-email-dengke.du@windriver.com>
	<2f2ca19a-5af9-aa71-23bc-c2d30ea43445@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 17 Apr 2017 07:43:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] openssh: upgrade to 7.5p1
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
X-List-Received-Date: Mon, 17 Apr 2017 06:43:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-17 at 12:37 +0800, Dengke Du wrote:
> Ping.

We do not take upgrades after feature freeze when we're stabilising
unless there is a pressing reason to do so. Your commit messages makes
no mention of any pressing reason.

Cheers,

Richard


