Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.online.nl (smtp02.online.nl [194.134.41.32])
	by mail.openembedded.org (Postfix) with ESMTP id 7D19F60089
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 16:14:40 +0000 (UTC)
Received: from smtp02.online.nl (localhost [127.0.0.1])
	by smtp02.online.nl (Postfix) with ESMTP id E84FFA461
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 17:14:37 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 17:14:37 +0100 (CET)
Message-ID: <54D78B6D.9040900@topic.nl>
Date: Sun, 08 Feb 2015 17:14:37 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>	<54D5ED44.90002@urbanec.net>
	<20150207115559.GA7478@crash.betafive.co.uk>
In-Reply-To: <20150207115559.GA7478@crash.betafive.co.uk>
X-Online-Scanned: by Cloudmark authority (on smtp02.online.nl)
Subject: Re: opkg refactoring
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
X-List-Received-Date: Sun, 08 Feb 2015 16:14:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

> I didn't realise people were following oe-core master on deployments of a few
> thousand systems! This is definitely a use-case for the stable branches.

In that case I have some interesting information  for you. OpenPLi also 
follows 'master' (because for many things we need the bleeding edge new 
stuff). OpenPLi and its derivatives are being used on millions of settop 
boxes. Just the "feed" servers consume about 4 terabytes of traffic each 
month.


-- 
Mike Looijmans

