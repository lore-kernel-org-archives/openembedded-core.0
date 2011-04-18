Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBkJP-0005EH-LK for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 11:00:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I8vi3l010517
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:57:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10049-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:57:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I8vZ4k010511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:57:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1303105369.git.ke.yu@intel.com>
References: <cover.1303105369.git.ke.yu@intel.com>
Date: Mon, 18 Apr 2011 09:57:26 +0100
Message-ID: <1303117046.5518.80.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] misc recipe upgrade
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
X-List-Received-Date: Mon, 18 Apr 2011 09:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 13:45 +0800, Yu Ke wrote:
> From: Yu Ke <ke.yu@intel.com>
> 
>  these are some remaining patches on my hand:
>  - remove old mesa recipe to cleanup mesa
>  - add python dependcy for mesa
>  - reassign Kevin's recipe
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: kyu3/upgrade-04-18
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upgrade-04-18
> 
> Thanks,
>     Yu Ke <ke.yu@intel.com>
> ---
> 
> 
> Yu Ke (3):
>   mesa 7.10.2: add python-native dependency
>   mesa: cleanup and remove the old version 7.5, 7.7 and 7.8.2
>   distro tracking: reassign Kevin's recipe

Merged to master, thanks.

Richard



