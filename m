Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 774717833C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:38:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6RLc6MB007157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 27 Jul 2017 22:38:08 +0100
Message-ID: <1501191486.22282.175.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 22:38:06 +0100
In-Reply-To: <cover.1500910727.git.akuster808@gmail.com>
References: <cover.1500910727.git.akuster808@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 27 Jul 2017 22:38:08 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 00/49] Pyro-next pull request
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
X-List-Received-Date: Thu, 27 Jul 2017 21:38:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-24 at 08:54 -0700, Armin Kuster wrote:
> Please consider these changes for the next Pyro merge.
> 
> Clean AB build ( thanks Ross).
> 
> Includes kernel updates, security fixes and misc bug fixes.
> 
> 
> The following changes since commit
> 5686f4e1fe5229705b8c7d35895aa03827796d13:
> 
>   tcf-agent: kill with USR2 in systemd stop (2017-07-20 11:00:23
> +0100)
> 
> are available in the git repository at:
> 
>   http://git.yoctoproject.org/git/poky-contrib akuster/pyro-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/pyro-next

Thanks for putting this together, I've merged it.

Cheers,

Richard

