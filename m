Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id C617560102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:18:48 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u9HBIkEV006887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 13:18:46 +0200
Received: from [139.16.78.254] (MD1FZU9C.ww002.siemens.net [139.16.78.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u9HBIjKU025494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 13:18:45 +0200
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
Date: Mon, 17 Oct 2016 13:18:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 11:18:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi

I read several discussions about lifting the default qemuarm target to armv7 or higher.
On the mailinglist and on the internet I also found several mentions about machines qemuarmv7 and qemuarma8, but I didn't find any working machine configs for them.

What are the planes here?

Is the goal to increase the default to a higher arm version?

Is there a bsp layer for other qemuarm variants (cortex-a8, ...)?

Regards
Pascal


