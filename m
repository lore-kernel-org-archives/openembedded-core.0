Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfEOZ-0003un-4E for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:59:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GtNbm022110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:55:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21561-10 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:55:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GtEE7022104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:55:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309883050.git.paul.eggleton@linux.intel.com>
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 17:54:35 +0100
Message-ID: <1310144075.20015.912.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] combo-layer tool v3
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
X-List-Received-Date: Fri, 08 Jul 2011 16:59:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 17:28 +0100, Paul Eggleton wrote:
> This is the third version of Yu Ke's combo-layer tool. Changes since v2:
>  * Fix splitpatch so that it handles commits that only affect some of the
>    components (reports the ones that have been skipped and avoids writing
>    out empty patches)
>  * A few fixes to the help text & comments
> 
> 
> The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:
> 
>   x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-v3
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-v3
> 
> Yu Ke (1):
>   combo-layer-tool: add tool to manipulate combo layers

Merged to master, thanks.

Richard



