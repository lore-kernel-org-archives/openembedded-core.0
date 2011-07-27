Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm5rB-0003G9-BF for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:17:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RFCqYb030710;
	Wed, 27 Jul 2011 16:12:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30197-05; Wed, 27 Jul 2011 16:12:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RFCk0i030704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 27 Jul 2011 16:12:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <35a96b8d01511443b0743cca3543a4cdc007cff2.1311738733.git.bruce.ashfield@windriver.com>
References: <cover.1311738733.git.bruce.ashfield@windriver.com>
	<35a96b8d01511443b0743cca3543a4cdc007cff2.1311738733.git.bruce.ashfield@windriver.com>
Date: Wed, 27 Jul 2011 16:12:36 +0100
Message-ID: <1311779556.2344.386.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-yocto: update SRCREVs
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
X-List-Received-Date: Wed, 27 Jul 2011 15:17:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 23:55 -0400, Bruce Ashfield wrote:
> Updating the linux-yocto SRCREVs to pickup changes from the
> continuing uprev to korg 3.0. With this set of update, the
> meta/feature audits are complete.
> 
> qemumips and qemuppc are fixed with this update and can now
> boot to a prompt.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Merged to master, thanks.

Richard



