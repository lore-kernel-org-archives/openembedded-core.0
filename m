Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRWuH-0006Wy-LU for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 23:55:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VLqD9o021780
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 22:52:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21614-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 22:52:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VLq8Xx021774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 22:52:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE55D5B.6070307@intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>
	<4DE53C21.7020000@linux.intel.com>	<4DE546AE.1090301@intel.com>
	<BANLkTimmP7rDQidBOBbA8TqVtHKMF7Bhuw@mail.gmail.com>
	<4DE55A95.2090302@windriver.com>  <4DE55D5B.6070307@intel.com>
Date: Tue, 31 May 2011 22:51:52 +0100
Message-ID: <1306878712.27470.380.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
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
X-List-Received-Date: Tue, 31 May 2011 21:55:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 14:27 -0700, Scott Garman wrote:
> So presumably this would mean: if it's about a recipe that is not in 
> OE-core, it's Poky-specific?

If its not bitbake and its not on OE-Core its poky specific.

> Which would also mean that discussion about anything in the bitbake 
> classes belongs on OE-core as well, yes?

Correct.

Cheers,

Richard



