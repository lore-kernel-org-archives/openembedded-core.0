Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id C5E9E6E88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 10:15:08 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 28EE12232068
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:15:07 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2414F2232066
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:15:04 +0100 (CET)
Date: Thu, 13 Feb 2014 11:14:59 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140213101459.GB2247@mail.itconsulting-heinold.de>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<52FC966A.6060701@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52FC966A.6060701@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Thu, 13 Feb 2014 10:15:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2014 at 05:54:50PM +0800, Robert Yang wrote:
> 
> Please hold on this, the recent changes of the prefuncs and postfuncs
> on bitbake makes it doesn't work on gcc-*, I will send a V2.
> 
> // Robert
> 

Hi Robert,

do not forget the sstate problems which of course happens on dora branch too.

Bye Henning

