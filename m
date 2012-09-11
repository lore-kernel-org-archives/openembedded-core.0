Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TBW6F-0001aE-Tp
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:26:20 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:13:47 -0700
Received: by obblz20 with SMTP id lz20so1356766obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=FTLUSEnE97O5+l9Ts14kWJRjMupEQcoI7BC9lIDnTAg=;
	b=Lt/JRTsbJHQN+wKnAh6xQq/RJLqJyKtBUUWR/QDmaeTV1uLlMWuHy4vxdD+WoC7N/K
	NbnFarTDL3jPunIp6qTv3Et1WpTKoApX/hjaOW9tQqAe6fc39C7EHBokDNNGYmYm+1uH
	r2uZ7xDRGA+QVxwYO0grRiE75189wmrTCOSrepwHbmL7agxmO0BNq8lyhGlXZIS99FDs
	YLXLc0BE/+bA3J4ruglBYBOUN5jtNEEot3jOgeLMgF/jqG7EahYPZjMr1PGna7D0q2zN
	zl++CVCVb958d2UdN40N4LnVJdp6gtmWvZHUbh2I7zhcEljSjp4s6R/cxwsvAXoE81uP
	+vaw==
Received: by 10.60.25.193 with SMTP id e1mr19306975oeg.87.1347390826591;
	Tue, 11 Sep 2012 12:13:46 -0700 (PDT)
Received: from [10.32.68.88] (72-254-23-251.client.stsn.net. [72.254.23.251])
	by mx.google.com with ESMTPS id
	bp7sm17201589obc.12.2012.09.11.12.13.44 (version=SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:13:44 -0700 (PDT)
Message-ID: <504F8D62.8010508@intel.com>
Date: Tue, 11 Sep 2012 12:13:38 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmIUFAvZZH31deWIDCSHSZ+vbmKc3w1wJ5nTHNs6/9SmQEgTpM0o+mQ9z+ec4ut5w8ohYWR
Subject: Sato virtual keyboard - how to close it?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:26:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

In the Sato desktop, there is a virtual keyboard which you can bring up 
to enter text from a touchscreen interface. Once that keyboard pops up, 
how do you close it? I'm not seeing anything obvious.

I'm helping out with a demo at a conference and could use this info 
urgently.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


