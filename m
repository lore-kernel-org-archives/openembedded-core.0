Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyVZC-000282-K8 for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:09:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UL51qV000915
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:05:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22082-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:04:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UL4rbf000898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:04:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314643520.git.paul.eggleton@linux.intel.com>
References: <cover.1314643520.git.paul.eggleton@linux.intel.com>
Date: Tue, 30 Aug 2011 22:04:42 +0100
Message-ID: <1314738282.5939.420.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] binutils upgrade additional metadata
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
X-List-Received-Date: Tue, 30 Aug 2011 21:09:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-29 at 19:47 +0100, Paul Eggleton wrote:
> Some collateral updates for the binutils upgrade.
> 
> The following changes since commit 4ecf379aba11983b66be4fbe26e65aa28740ddfd:
> 
>   binutils: update to 2.21.1a (2011-08-29 13:57:43 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/binutils-2211a-extra
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/binutils-2211a-extra
> 
> Paul Eggleton (2):
>   tcmode-default: update binutils version
>   distro_tracking_fields: update binutils to 2.21.1a

Merged to master, thanks.

Richard



