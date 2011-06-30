Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcQUb-0004SE-I5 for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:17:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMmepM031710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:48:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27728-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:48:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMmWo9031686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:48:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309457351-6103-1-git-send-email-michael.lippautz@gmail.com>
References: <1309457351-6103-1-git-send-email-michael.lippautz@gmail.com>
Date: Thu, 30 Jun 2011 23:48:13 +0100
Message-ID: <1309474093.20015.480.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] linux-firmware: Add Realtex rt8192* firmwares
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
X-List-Received-Date: Thu, 30 Jun 2011 23:17:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 20:09 +0200, Michael Lippautz wrote:
> This patch adds the firmware files for:
>  * rt8192cu
>  * rt8192ce
>  * rt8192su
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>

Merged to master, thanks.

For reference, I changed the file modes to 0644 as per some other recent
audit changed we were making.

Cheers,

Richard



