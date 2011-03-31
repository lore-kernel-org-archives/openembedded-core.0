Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q5J2d-0007DA-Ss for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:40:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEc9Ub027009;
	Thu, 31 Mar 2011 15:38:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26603-07; Thu, 31 Mar 2011 15:38:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEc3Oa027003
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 31 Mar 2011 15:38:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1301578942.git.paul.eggleton@linux.intel.com>
References: <cover.1301578942.git.paul.eggleton@linux.intel.com>
Date: Thu, 31 Mar 2011 15:38:00 +0100
Message-ID: <1301582280.24596.111.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 0/1] remove u-boot flashing instructions for mpc8315e-rdb
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
X-List-Received-Date: Thu, 31 Mar 2011 14:40:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 14:46 +0100, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Upgrading u-boot is apparently not necessary with current board revisions,
> and these instructions may not work properly anyway (our toolchain seems not
> to be able to compile u-boot in the way described), and given that they are
> potentially risky they should be removed.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: paule/readme-hardware-fix3
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/readme-hardware-fix3
> 
> Thanks,
>     Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> 
> 
> Paul Eggleton (1):
>   README.hardware: remove u-boot flashing instructions for mpc8315e-rdb

Merged to master, thanks.

Richard



