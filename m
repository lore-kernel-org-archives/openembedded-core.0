Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=428cd3cda=rich.pixley@palm.com>)
	id 1SDIdh-0004ak-6n for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:55:57 +0200
X-IronPort-AV: E=Sophos;i="4.75,338,1330934400"; d="scan'208";a="12576865"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 29 Mar 2012 09:45:47 -0700
Received: from flamingo.palm.com (flamingo.palm.com [148.92.244.134])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q2TGjl1M015337;
	Thu, 29 Mar 2012 09:45:47 -0700
Message-ID: <4F7491BB.9000201@palm.com>
Date: Thu, 29 Mar 2012 09:45:47 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120314 Thunderbird/12.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: chasing mirrors
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
X-List-Received-Date: Thu, 29 Mar 2012 16:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

How do I determine which mirror was/is being used to download a 
particular component?

I'm expecting some info in a log, or from the output of "bitbake -D", 
but I'm not finding it.  And from a glance at the code I don't see any 
message statements around the mirror iterations although I could easily 
be missing it.

--rich


