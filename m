Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BC3C573237
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 11:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C381F2E4DC;
	Wed, 29 Jul 2015 13:49:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id D1ggo8SzD53r; Wed, 29 Jul 2015 13:49:00 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 26CBF2E0C6;
	Wed, 29 Jul 2015 13:49:00 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 02F49109E;
	Wed, 29 Jul 2015 13:49:00 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id E6BF3BAE;
	Wed, 29 Jul 2015 13:48:59 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id E46E03404A;
	Wed, 29 Jul 2015 13:48:59 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Wed, 29 Jul 2015
	13:48:59 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 6583B9C68B; 
	Wed, 29 Jul 2015 13:48:59 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <55B8A89A.6050406@windriver.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
	<55B8A89A.6050406@windriver.com>
Date: Wed, 29 Jul 2015 13:48:59 +0200
Message-ID: <1438170429-sup-8609@axis.com>
User-Agent: Sup/0.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Wed, 29 Jul 2015 11:49:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from Robert Yang's message of 2015-07-29 12:19:06 +0200:
> It is just like what GNOME_GIT, GNU_MIRROR and others did.

Tbh, I don't understand them either, but maybe that's just me. What is
the reason? I think it makes it harder to see what is happening.

-- 
olof johansson

