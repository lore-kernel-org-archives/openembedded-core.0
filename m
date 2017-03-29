Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 1736 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Mar 2017 13:18:52 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [74.55.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA6471AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:18:52 +0000 (UTC)
Received: from [192.168.1.14] (c-73-10-189-235.hsd1.nj.comcast.net
	[73.10.189.235])
	by smtp.webfaction.com (Postfix) with ESMTP id 92A872079372;
	Wed, 29 Mar 2017 12:49:57 +0000 (UTC)
From: Bob Cochran <openembedded@mindchasers.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <699e3efa-95bb-fc2c-ba12-5a5e7807acb9@mindchasers.com>
Date: Wed, 29 Mar 2017 08:49:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Cc: mlauer@vanille-media.de
Subject: python: manifest files have a bad link to "Embedded Systems Site"
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
X-List-Received-Date: Wed, 29 Mar 2017 13:18:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

These files: python-2.7-manifest.inc  python-3.5-manifest.inc 
python-native-2.7-manifest.inc  python-native-3.5-manifest.inc

all have:

"Visit the Python for Embedded Systems Site => 
http://www.Vanille.de/projects/python.spy"

That URL returns a 404

Someone want to fix the link?

Otherwise, I'll be happy to submit a patch if provided guidance on what 
site these files should now reference.

Bob





