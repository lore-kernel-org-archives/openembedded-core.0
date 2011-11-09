Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNxan-0005an-HW
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 03:08:45 +0100
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Nov 2011 18:02:15 -0800
Received: by pzk32 with SMTP id 32so567537pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 18:02:15 -0800 (PST)
Received: by 10.68.23.130 with SMTP id m2mr1110752pbf.120.1320804134975;
	Tue, 08 Nov 2011 18:02:14 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id c3sm8822614pbt.12.2011.11.08.18.02.13
	(version=SSLv3 cipher=OTHER); Tue, 08 Nov 2011 18:02:14 -0800 (PST)
Message-ID: <4EB9DF31.7070904@intel.com>
Date: Tue, 08 Nov 2011 18:02:25 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: openssl 1.0?
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
X-List-Received-Date: Wed, 09 Nov 2011 02:08:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I wanted to get some feedback from the community about OpenSSL 1.0. We 
currently only support 0.9.8 in oe-core. Specifically: should we add 
openssl 1.0 to oe-core, and should the rest of our recipes build against 
it by default?

I imagine if we add 1.0 we'll still want to keep the 0.9.8 around for 
some time.

Thoughts?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


