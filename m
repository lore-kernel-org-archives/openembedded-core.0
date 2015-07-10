Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 28675737F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6AEGFOp013617; Fri, 10 Jul 2015 15:16:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a8Ut0XDBQPwS; Fri, 10 Jul 2015 15:16:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6AEG1AU013606
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Jul 2015 15:16:13 +0100
Message-ID: <1436537761.3310.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenzong.fan@windriver.com
Date: Fri, 10 Jul 2015 15:16:01 +0100
In-Reply-To: <1436506574-3408-1-git-send-email-wenzong.fan@windriver.com>
References: <1436506574-3408-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rpcbind: handle rpcbind options
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
X-List-Received-Date: Fri, 10 Jul 2015 14:16:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-10 at 13:36 +0800, wenzong.fan@windriver.com wrote:
> From: Li Wang <li.wang@windriver.com>
> 
> the patch refers to:
> https://bugs.launchpad.net/ubuntu/+source/rpcbind/+bug/835833
> 
> Run test:
> $ systemctl restart rpcbind
> $ systemctl status rpcbind


I shouldn't have to follow a link to figure out what the patch is for,
why or how. Please improve the commit message.

Cheers,

Richard


