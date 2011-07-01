Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qcg7U-0008UH-Mm for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:59:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61FtIeQ012461;
	Fri, 1 Jul 2011 16:55:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12158-06; Fri,  1 Jul 2011 16:55:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61FtDLN012452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 16:55:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309497002.git.scott.a.garman@intel.com>
References: <cover.1309497002.git.scott.a.garman@intel.com>
Date: Fri, 01 Jul 2011 16:54:50 +0100
Message-ID: <1309535690.20015.524.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] useradd.bbclass: new class for managing user/group permissions [v3]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2011 15:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 22:11 -0700, Scott Garman wrote:
> This pull request should be complete based on Richard's second round
> of feedback.
> 
> Thanks,
> 
> Scott
> 
> The following changes since commit 1c1372e7eccb01f7c1f682bc0aa989c37f2516f6:
> 
>   bitbake.conf: update PSEUDO_PASSWD variable (2011-07-01 00:13:25 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/useradd-v3
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-v3
> 
> Scott Garman (2):
>   useradd.bbclass: new class for managing user/group permissions
>   useradd-example: example recipe for using inherit useradd

Merged to master, thanks.

Richard



