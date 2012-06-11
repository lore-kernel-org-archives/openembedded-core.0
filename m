Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Se1kJ-0002Ee-9o for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 12:21:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BAAfSA013864;
	Mon, 11 Jun 2012 11:10:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13603-02; Mon, 11 Jun 2012 11:10:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BAAUZn013858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 11 Jun 2012 11:10:32 +0100
Message-ID: <1339409433.30460.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 11:10:33 +0100
In-Reply-To: <cover.1339163939.git.tom.zanussi@intel.com>
References: <cover.1339163939.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix linux-yocto-3.2 SRCREV typo
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
X-List-Received-Date: Mon, 11 Jun 2012 10:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 09:02 -0500, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> Did a fresh pull this morning and noticed a typo in the meta SRCREV...
> 
> The following changes since commit 0612cf3fcb3365e7721a2d5c331f8cd2647ae60b:
>   Kang Kai (1):
>         hob2: create a standalone deploy image tool
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/3.2-meta-srcrev-typo-fix
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/3.2-meta-srcrev-typo-fix
> 
> Tom Zanussi (1):
>   linux-yocto/3.2: fix meta SRCREV typo

Merged to master, thanks.

Richard



