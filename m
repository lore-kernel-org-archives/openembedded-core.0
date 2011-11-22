Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1RSujT-0001I0-Eq
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:06:11 +0100
Received: by bkbzs2 with SMTP id zs2so519051bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 09:59:37 -0800 (PST)
Received: by 10.204.133.216 with SMTP id g24mr20544004bkt.82.1321984776990;
	Tue, 22 Nov 2011 09:59:36 -0800 (PST)
Received: from [9.152.224.38] (deibp9eh1--blueice3n2.emea.ibm.com.
	[195.212.29.180])
	by mx.google.com with ESMTPS id k26sm19419766fab.8.2011.11.22.09.59.35
	(version=SSLv3 cipher=OTHER); Tue, 22 Nov 2011 09:59:36 -0800 (PST)
Message-ID: <4ECBE307.1080600@linaro.org>
Date: Tue, 22 Nov 2011 18:59:35 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Getting started on creating a layer for OE-Core
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
X-List-Received-Date: Tue, 22 Nov 2011 18:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm currently reading the OpenEmbedded User Manual and wondering what's 
the best way to add a layer for the Linaro toolchain components (Linaro 
GCC, Linaro GDB). This is my first time with OE. I just setup the 
environment and started to build an image that targets qemuarm (bitbake 
is still building). Any suggestions or general help is much appreciated.

Thanks,
Ken


